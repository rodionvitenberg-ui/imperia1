#!/usr/bin/env python3
"""
Convert pg_dump --column-inserts output to INSERT ... ON CONFLICT (id) DO UPDATE SET ...
so that local data overwrites server data on duplicate primary keys.
"""

import re
import sys

INSERT_PATTERN = re.compile(
    r'^(INSERT INTO\s+(public\.)?(\w+))\s+\(([^)]+)\)\s+VALUES\s*\((.+)\);\s*$',
    re.IGNORECASE | re.DOTALL
)

# Tables that use composite primary keys (no single 'id' column)
# These will be left as plain INSERTs
COMPOSITE_PK_TABLES = {
    'auth_group_permissions',
    'customers_customer_groups',
    'customers_customer_user_permissions',
    'products_category',
    'products_product_categories',
    'products_product_tags',
}

def extract_col_names(cols_str: str) -> list[str]:
    """Extract column names from the parenthesized list."""
    return [c.strip().strip('"') for c in cols_str.split(',')]

def extract_values(values_str: str) -> list[str]:
    """
    Split VALUES clause into individual values, respecting parentheses nesting.
    Returns a list of value strings.
    """
    values = []
    depth = 0
    current = []
    i = 0
    paren_depth = 0
    
    # Wrap in outer parens to handle the VALUES ( ... ) structure
    # The input already has the outer parens removed by regex group (5)
    s = values_str.strip()
    
    # We need to handle: (val1, val2), (val3, val4), ...
    # Split on ',' at depth 0 (not inside parentheses)
    parts = []
    current_part = []
    for ch in s:
        if ch == '(':
            paren_depth += 1
            current_part.append(ch)
        elif ch == ')':
            paren_depth -= 1
            current_part.append(ch)
        elif ch == ',' and paren_depth == 0:
            parts.append(''.join(current_part).strip())
            current_part = []
        else:
            current_part.append(ch)
    if current_part:
        parts.append(''.join(current_part).strip())
    
    return parts

def has_id_column(cols: list[str]) -> bool:
    """Check if 'id' is one of the columns."""
    return 'id' in cols or '"id"' in cols

def convert_insert(line: str) -> str:
    """Convert a single INSERT line to ON CONFLICT DO UPDATE format."""
    m = INSERT_PATTERN.match(line)
    if not m:
        return line
    
    full_prefix = m.group(1)  # "INSERT INTO public.tablename"
    table_name = m.group(3)   # "tablename"
    cols_str = m.group(4)     # "col1, col2, ..."
    values_part = m.group(5)  # "(val1, val2, ...), (val3, val4, ...), ..."
    
    cols = extract_col_names(cols_str)
    
    # Skip composite PK tables — leave as plain INSERT
    if table_name in COMPOSITE_PK_TABLES:
        return line
    
    # If table has no 'id' column, leave as plain INSERT
    if not has_id_column(cols):
        return line
    
    # Build SET clause: col1 = EXCLUDED.col1, col2 = EXCLUDED.col2, ...
    set_clause = ', '.join(
        f'{col} = EXCLUDED.{col}' for col in cols
    )
    
    # For single-row VALUES, rewrite inline
    # For multi-row VALUES, we need to handle each row separately
    # Actually pg_dump --column-inserts generates one INSERT per row
    # So we just need: INSERT INTO table (cols) VALUES (vals) ON CONFLICT (id) DO UPDATE SET ...
    
    # Replace the semicolon at end with ON CONFLICT clause
    if line.rstrip().endswith(';'):
        base = line.rstrip()[:-1].rstrip()
        return f'{base} ON CONFLICT (id) DO UPDATE SET {set_clause};\n'
    
    return line

def main():
    if len(sys.argv) < 2:
        print("Usage: convert_dump.py <input.sql> [output.sql]")
        sys.exit(1)
    
    input_path = sys.argv[1]
    output_path = sys.argv[2] if len(sys.argv) > 2 else input_path.replace('.sql', '_on_conflict.sql')
    
    with open(input_path, 'r') as f:
        content = f.read()
    
    # Process line by line
    lines = content.split('\n')
    result_lines = []
    
    in_data_section = False
    for line in lines:
        stripped = line.strip()
        
        # Check if we're in a data section
        if stripped.startswith('-- Data for Name:'):
            in_data_section = True
            result_lines.append(line)
            continue
        
        # Check if we've left the data section (next non-data, non-empty, non-comment line that isn't INSERT)
        if in_data_section and stripped.startswith('INSERT INTO'):
            converted = convert_insert(line)
            result_lines.append(converted)
        else:
            result_lines.append(line)
            # If we see a non-INSERT, non-comment, non-empty line after being in data section,
            # we might have left it. But keep going — the file structure is linear.
    
    with open(output_path, 'w') as f:
        f.write('\n'.join(result_lines))
    
    print(f"Converted dump written to: {output_path}")

if __name__ == '__main__':
    main()