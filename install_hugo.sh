#!/bin/bash

# Get latest version number from GitHub API
VERSION=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | grep tag_name | cut -d '"' -f 4)

# Download the Extended version
FILENAME="hugo_extended_${VERSION#v}_Linux-64bit.deb"
URL="https://github.com/gohugoio/hugo/releases/download/${VERSION}/${FILENAME}"

echo "Downloading Hugo Extended version $VERSION from $URL"
wget "$URL"

# Install
sudo dpkg -i "$FILENAME"

# Clean up
rm "$FILENAME"

# Check version
hugo version
