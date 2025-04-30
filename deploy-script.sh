#!/bin/bash

# Print current directory and contents
echo "Current directory: $(pwd)"
echo "Listing all files and directories:"
ls -la

# Helper function to check if a directory is a valid Next.js project
is_nextjs_project() {
  if [ -f "$1/package.json" ] && [ -f "$1/next.config.js" ] || [ -f "$1/next.config.ts" ]; then
    echo "$1 appears to be a valid Next.js project"
    return 0
  else
    echo "$1 is not a valid Next.js project"
    return 1
  fi
}

# Try resume-2023-new first (as specified in the original config)
if [ -d "resume-2023-new" ] && is_nextjs_project "resume-2023-new"; then
  echo "Using resume-2023-new directory"
  cd resume-2023-new
  npm install
  npm run build
  echo "Build completed in resume-2023-new"
  mkdir -p ../.next
  cp -r .next/* ../.next/
  echo "Copied build artifacts to root .next directory"
  exit 0
fi

# Try resume-2023 as fallback
if [ -d "resume-2023" ] && is_nextjs_project "resume-2023"; then
  echo "Using resume-2023 directory"
  cd resume-2023
  npm install
  npm run build
  echo "Build completed in resume-2023"
  mkdir -p ../.next
  cp -r .next/* ../.next/
  echo "Copied build artifacts to root .next directory"
  exit 0
fi

# Last resort - search for any directory containing Next.js project
echo "Searching for any Next.js project in subdirectories..."
for dir in */; do
  if is_nextjs_project "${dir%/}"; then
    echo "Found Next.js project in ${dir%/}"
    cd "${dir%/}"
    npm install
    npm run build
    echo "Build completed in ${dir%/}"
    mkdir -p ../.next
    cp -r .next/* ../.next/
    echo "Copied build artifacts to root .next directory"
    exit 0
  fi
done

echo "No valid Next.js project directory found"
exit 1 