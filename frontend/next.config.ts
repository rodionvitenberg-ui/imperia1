import type { NextConfig } from "next";

function apiBaseUrl(): { origin: string; hostname: string; port: string; protocol: 'http' | 'https' } {
  const raw = process.env.NEXT_PUBLIC_API_BASE_URL || 'http://127.0.0.1:8000';
  const url = new URL(raw);
  return {
    origin: url.origin,
    hostname: url.hostname,
    port: url.port || (url.protocol === 'https:' ? '443' : '80'),
    protocol: url.protocol.replace(':', '') as 'http' | 'https',
  };
}

const apiUrl = apiBaseUrl();

const nextConfig: NextConfig = {
  images: {
    unoptimized: true,
    remotePatterns: [
      {
        protocol: 'http',
        hostname: '92.113.146.158',
        port: '8000',
        pathname: '/media/**',
      },
      {
        protocol: 'http',
        hostname: 'localhost',
        port: '8000',
        pathname: '/media/**',
      },
      {
        protocol: apiUrl.protocol,
        hostname: apiUrl.hostname,
        port: apiUrl.port,
        pathname: '/media/**',
      },
      {
        protocol: 'https',
        hostname: 'picsum.photos',
        pathname: '/**',
      },
    ],
  },
  async rewrites() {
    return [
      {
        source: '/api/:path*',
        destination: `${apiUrl.origin}/api/:path*`,
      },
    ];
  },
};

export default nextConfig;