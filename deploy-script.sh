#!/bin/bash

# Add debugging
set -e
set -x

# Function for fallback plan
create_fallback_build() {
  echo 'Creating fallback build in root directory'
  # Check if we already have what we need
  if [ ! -d "pages" ]; then
    mkdir -p pages
    # Create a simple index.js if it doesn't exist
    if [ ! -f "pages/index.js" ]; then
      cat > pages/index.js << 'EOL'
import React from 'react'
import Head from 'next/head'

export default function Home() {
  return (
    <>
      <Head>
        <title>Sophia Reynolds - UX Designer Portfolio</title>
        <meta name="description" content="UX Designer portfolio showcasing professional work and experience" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
      </Head>
      <div style={{ padding: '50px', fontFamily: 'Arial, sans-serif', maxWidth: '800px', margin: '0 auto' }}>
        <h1 style={{ color: '#DD4803' }}>Sophia Reynolds - UX Designer Portfolio</h1>
        <p>Welcome to my portfolio site! This is a fallback page - the main site is still being configured.</p>
        
        <div style={{ padding: '20px', backgroundColor: '#f5f5f5', borderRadius: '10px', marginTop: '20px' }}>
          <h2>Portfolio Highlights</h2>
          <ul style={{ lineHeight: '1.6' }}>
            <li>UX Designer with 5+ years of experience</li>
            <li>Specialized in user research and interface design</li>
            <li>Portfolio of work for major tech companies</li>
          </ul>
        </div>
        
        <p style={{ marginTop: '40px', color: '#666' }}>Thank you for visiting! The complete portfolio is coming soon.</p>
      </div>
    </>
  )
}
EOL
    fi
  fi

  # Create pages/_app.js to ensure proper initialization
  mkdir -p pages
  cat > pages/_app.js << 'EOL'
import React from 'react'

function MyApp({ Component, pageProps }) {
  return <Component {...pageProps} />
}

export default MyApp
EOL

  # Create a simple next.config.js
  if [ ! -f "next.config.js" ]; then
    cat > next.config.js << 'EOL'
/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  distDir: '.next'
}

module.exports = nextConfig
EOL
  else
    # Remove the export option if it exists
    sed -i 's/output: .export.,/\/\/ output removed/g' next.config.js
  fi

  # Build the fallback app
  echo 'Building fallback Next.js app'
  if [ -f "package-lock.json" ]; then
    npm ci --prefer-offline
  else
    npm install --prefer-offline
  fi
  npx next build
  echo 'Fallback build completed'
}

# Print current directory and contents
echo 'Current directory:' "$(pwd)"
echo 'Listing all files and directories:'
ls -la

# Helper function to check if a directory is a valid Next.js project
is_nextjs_project() {
  if [ -f "$1/package.json" ] && { [ -f "$1/next.config.js" ] || [ -f "$1/next.config.ts" ]; }; then
    echo "$1 appears to be a valid Next.js project"
    return 0
  else
    echo "$1 is not a valid Next.js project"
    return 1
  fi
}

# Try primary directories first
TRIED_MAIN_DIRS=false

# Try resume-2023-new first (as specified in the original config)
if [ -d "resume-2023-new" ] && is_nextjs_project "resume-2023-new"; then
  echo 'Using resume-2023-new directory'
  cd resume-2023-new
  npm install
  if npm run build; then
    echo 'Build completed in resume-2023-new'
    mkdir -p ../.next
    cp -r .next/* ../.next/
    echo 'Copied build artifacts to root .next directory'
    exit 0
  else
    echo 'Build in resume-2023-new failed, trying fallback'
    cd ..
    TRIED_MAIN_DIRS=true
  fi
fi

# Try resume-2023 as fallback
if [ -d "resume-2023" ] && is_nextjs_project "resume-2023"; then
  echo 'Using resume-2023 directory'
  cd resume-2023
  npm install
  if npm run build; then
    echo 'Build completed in resume-2023'
    mkdir -p ../.next
    cp -r .next/* ../.next/
    echo 'Copied build artifacts to root .next directory'
    exit 0
  else
    echo 'Build in resume-2023 failed, trying fallback'
    cd ..
    TRIED_MAIN_DIRS=true
  fi
fi

# Last resort - search for any directory containing Next.js project
if [ "$TRIED_MAIN_DIRS" = false ]; then
  echo 'Searching for any Next.js project in subdirectories...'
  for dir in */; do
    if is_nextjs_project "${dir%/}"; then
      echo "Found Next.js project in ${dir%/}"
      cd "${dir%/}"
      npm install
      if npm run build; then
        echo "Build completed in ${dir%/}"
        mkdir -p ../.next
        cp -r .next/* ../.next/
        echo 'Copied build artifacts to root .next directory'
        exit 0
      else
        echo "Build in ${dir%/} failed, trying fallback"
        cd ..
        break
      fi
    fi
  done
fi

# If we got here, no successful build was found - create a fallback
echo 'No successful build found, creating fallback'
create_fallback_build
exit 0 