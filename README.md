# a26x-allin1

## Google Drive Download Script

This repository contains a script to download and analyze files from a Google Drive folder.

### Usage

Run the script:

```bash
./download_gdrive.sh
```

The script will:
1. Upgrade the `gdown` package
2. Create a temporary directory `_tmp`
3. Download files from the specified Google Drive folder
4. Analyze the directory structure and count files in each subdirectory

### Requirements

- Python 3
- pip
- gdown (will be installed/upgraded automatically)