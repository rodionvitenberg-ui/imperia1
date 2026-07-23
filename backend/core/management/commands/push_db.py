"""
Management command to push local database dump to remote server.
Reads credentials from backend/remote_db.env and executes complete_dump.sql
with ON CONFLICT DO UPDATE to overwrite duplicate records.

Usage:
    python manage.py push_db [--dump PATH]

    --dump PATH   Path to dump file (default: ../complete_dump.sql)
"""

import os
import sys
from pathlib import Path
from django.core.management.base import BaseCommand
from django.conf import settings
import psycopg2
from dotenv import load_dotenv


class Command(BaseCommand):
    help = 'Push local database dump to remote server with ON CONFLICT DO UPDATE'

    def add_arguments(self, parser):
        parser.add_argument(
            '--dump',
            type=str,
            default=None,
            help='Path to dump file (default: complete_dump.sql in project root)',
        )

    def handle(self, *args, **options):
        # 1. Load remote DB credentials
        remote_env_path = Path(settings.BASE_DIR) / 'remote_db.env'
        if not remote_env_path.exists():
            self.stderr.write(
                self.style.ERROR(f'remote_db.env not found at {remote_env_path}')
            )
            sys.exit(1)

        load_dotenv(remote_env_path)

        db_config = {
            'host': os.getenv('REMOTE_DB_HOST'),
            'port': os.getenv('REMOTE_DB_PORT', '5432'),
            'dbname': os.getenv('REMOTE_DB_NAME'),
            'user': os.getenv('REMOTE_DB_USER'),
            'password': os.getenv('REMOTE_DB_PASSWORD'),
        }

        missing = [k for k, v in db_config.items() if not v]
        if missing:
            self.stderr.write(
                self.style.ERROR(
                    f'Missing remote DB credentials in remote_db.env: {", ".join(missing)}'
                )
            )
            sys.exit(1)

        # 2. Resolve dump path
        dump_path = options.get('dump')
        if not dump_path:
            dump_path = str(Path(settings.BASE_DIR).parent / 'complete_dump.sql')

        dump_file = Path(dump_path)
        if not dump_file.exists():
            self.stderr.write(
                self.style.ERROR(f'Dump file not found: {dump_file}')
            )
            sys.exit(1)

        self.stdout.write(f'Connecting to remote DB at {db_config["host"]}:{db_config["port"]}...')

        # 3. Connect to remote DB
        try:
            conn = psycopg2.connect(**db_config)
            conn.set_session(autocommit=False)
            cursor = conn.cursor()
        except Exception as e:
            self.stderr.write(self.style.ERROR(f'Connection failed: {e}'))
            sys.exit(1)

        self.stdout.write(self.style.SUCCESS('Connected successfully.'))

        # 4. Execute dump
        self.stdout.write(f'Reading dump file: {dump_file}...')
        try:
            sql = dump_file.read_text(encoding='utf-8')
        except Exception as e:
            self.stderr.write(self.style.ERROR(f'Failed to read dump file: {e}'))
            conn.close()
            sys.exit(1)

        self.stdout.write(f'Executing dump ({len(sql)} bytes)...')

        try:
            # Disable triggers temporarily to handle circular FK constraints
            cursor.execute("SET session_replication_role = 'replica';")

            # Split by statement and execute
            cursor.execute(sql)

            # Re-enable triggers
            cursor.execute("SET session_replication_role = 'origin';")

            conn.commit()
            self.stdout.write(self.style.SUCCESS('Dump executed successfully!'))
        except Exception as e:
            conn.rollback()
            self.stderr.write(self.style.ERROR(f'Execution failed: {e}'))
            sys.exit(1)
        finally:
            cursor.close()
            conn.close()