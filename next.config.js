/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  distDir: '.next',
  generateEtags: false,
  poweredByHeader: false,
  headers: async () => {
    return [
      {
        source: '/:path*',
        headers: [
          {
            key: 'Cache-Control',
            value: 'public, max-age=0, must-revalidate',
          },
        ],
      },
    ];
  },
  // Ensure unique build IDs to prevent stale cache issues
  generateBuildId: async () => {
    return `build-${Date.now()}`;
  },
}

module.exports = nextConfig 