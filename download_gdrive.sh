#!/bin/bash

# Download and analyze files from Google Drive folder
# This script uses gdown to download a folder from Google Drive
# and analyzes the directory structure

set -e  # Exit on error

# Upgrade gdown to the latest version
echo "Upgrading gdown..."
python3 -m pip install --upgrade gdown >/dev/null

# Create temporary directory
echo "Creating temporary directory..."
rm -rf _tmp && mkdir _tmp && cd _tmp

# Download folder from Google Drive
echo "Downloading folder from Google Drive..."
gdown --folder "https://drive.google.com/drive/folders/1OwNmlddErTPpx1g28qOHkVqN5fi8quwh" --no-cookies --continue --remaining-ok

# Find the top-level directory
TOP="$(find . -mindepth 1 -maxdepth 1 -type d | head -n 1)"
echo "TOP=$TOP"

# Iterate through subdirectories and count files
for d in "$TOP"/*; do
  [ -d "$d" ] || continue
  echo "==== $(basename "$d") ===="
  find "$d" -maxdepth 1 -type f | wc -l
done
