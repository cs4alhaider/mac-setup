#!/bin/bash

# Repository details
REPO="tonsky/FiraCode"
ASSET_DIR="$HOME/Desktop/temp-firacode"
FONT_DIR="$HOME/Library/Fonts"

echo "Starting FiraCode font installation process..."

# Fetch the latest release data from GitHub API
echo "Fetching the latest release data for $REPO..."
LATEST_RELEASE=$(curl -s "https://api.github.com/repos/$REPO/releases/latest")

# Extract assets URL without using -P
echo "Extracting assets URL..."
ASSETS_URL=$(echo "$LATEST_RELEASE" | grep -o '"assets_url": "[^"]*' | sed 's/"assets_url": "//')

# Check if we got the assets URL
if [ -z "$ASSETS_URL" ]; then
  echo "Failed to fetch the latest release assets for $REPO."
  exit 1
fi

# Create directory to store downloaded assets
echo "Creating directory to store downloaded assets at $ASSET_DIR..."
mkdir -p "$ASSET_DIR"

# Fetch asset information and download ZIP file
echo "Fetching asset information from assets URL..."
ASSETS=$(curl -s "$ASSETS_URL")

echo "Processing assets to find and download the .zip file..."
echo "$ASSETS" | grep -o '"browser_download_url": "[^"]*' | sed 's/"browser_download_url": "//' | while read -r URL; do
  FILE_NAME=$(basename "$URL")
  
  # Download only the .zip file containing TTF fonts
  if [[ "$FILE_NAME" == *.zip ]]; then
    echo "Downloading $FILE_NAME from $URL..."
    curl -L "$URL" -o "$ASSET_DIR/$FILE_NAME"
    
    # Extract the ZIP file
    echo "Extracting $FILE_NAME..."
    unzip -o "$ASSET_DIR/$FILE_NAME" -d "$ASSET_DIR"

    # Move all TTF files from extracted folder to Fonts directory
    if [ -d "$ASSET_DIR/ttf" ]; then
      echo "Moving TTF files from extracted folder to $FONT_DIR..."
      mv "$ASSET_DIR/ttf/"*.ttf "$FONT_DIR"
    else
      echo "TTF folder not found in the extracted files."
    fi
  else
    echo "$FILE_NAME is not a .zip file containing TTF fonts, skipping..."
  fi
done

# Cleanup
echo "Cleaning up temporary assets directory at $ASSET_DIR..."
rm -rf "$ASSET_DIR"

echo "FiraCode fonts installed successfully to $FONT_DIR."
