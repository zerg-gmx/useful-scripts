#!/bin/bash

# Usage: sh install.sh /path/u/wish/to/install [path/to/ssl]

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "Usage: sh install.sh /path/u/wish/to/install [path/to/ssl]"
    exit 1
fi

INSTALL_DIR=$1
SSL_PATH=$2
ARCHIVES_DIR="$INSTALL_DIR/archives"

# Create necessary directories
mkdir -p "$INSTALL_DIR"
mkdir -p "$ARCHIVES_DIR"

# Record current directory
START_DIR=$(pwd)

# Ensure return to start directory on exit or error
trap 'cd "$START_DIR"' EXIT

# Set versions (use latest stable versions)
PCRE_VERSION="8.45"  # Latest stable version as of writing
NGINX_VERSION="1.24.0"  # Latest stable version as of writing

# URLs for downloading
PCRE_URL="https://sourceforge.net/projects/pcre/files/pcre/$PCRE_VERSION/pcre-$PCRE_VERSION.tar.gz"
NGINX_URL="http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz"

# Download source tarballs with error checking
wget $PCRE_URL -P "$INSTALL_DIR"
if [ $? -ne 0 ]; then
    echo "Failed to download PCRE. Exiting."
    exit 1
fi

wget $NGINX_URL -P "$INSTALL_DIR"
if [ $? -ne 0 ]; then
    echo "Failed to download NGINX. Exiting."
    exit 1
fi

# Extract tarballs
cd "$INSTALL_DIR"
tar -xzf "pcre-$PCRE_VERSION.tar.gz"
tar -xzf "nginx-$NGINX_VERSION.tar.gz"

# Move tarballs to archives directory
mv "pcre-$PCRE_VERSION.tar.gz" "$ARCHIVES_DIR"
mv "nginx-$NGINX_VERSION.tar.gz" "$ARCHIVES_DIR"

# Prepare PCRE for installation
cd "pcre-$PCRE_VERSION"
mkdir install
# Move files except 'install' directory
find . -mindepth 1 -maxdepth 1 -not -name install -exec mv {} install/ \;
cd install
./configure --prefix="$INSTALL_DIR/pcre-$PCRE_VERSION/install"
make
make install

# Prepare NGINX for installation
cd "$INSTALL_DIR/nginx-$NGINX_VERSION"
mkdir install
# Move files except 'install' directory
find . -mindepth 1 -maxdepth 1 -not -name install -exec mv {} install/ \;

# Ensure the install directory is clean before proceeding
find install -mindepth 1 -exec rm -rf {} \;

cd install

# Configure NGINX with or without custom SSL path
if [ -z "$SSL_PATH" ]; then
    ./configure --prefix="$INSTALL_DIR/nginx-$NGINX_VERSION/install" --with-pcre="$INSTALL_DIR/pcre-$PCRE_VERSION/install"
else
    ./configure --prefix="$INSTALL_DIR/nginx-$NGINX_VERSION/install" --with-pcre="$INSTALL_DIR/pcre-$PCRE_VERSION/install" --with-openssl="$SSL_PATH"
fi

make
make install

echo "Installation completed successfully!"
