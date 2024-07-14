#!/bin/bash

# Check if the prefix argument is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <prefix>"
  exit 1
fi

INITIAL_CWD=$(pwd)
PREFIX=$1
ARCHIVE_DIR="${PREFIX}/archives"
NGINX_VERSION="1.21.6"

# Update system packages
sudo apt update && sudo apt upgrade -y

# Install dependencies
sudo apt install -y build-essential libpcre3-dev libssl-dev zlib1g-dev

# Download Nginx source code (replace with latest version)
wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz

# Extract the downloaded file
tar xzvf nginx-${NGINX_VERSION}.tar.gz
mkdir -p ${ARCHIVE_DIR}
mv nginx-${NGINX_VERSION}.tar.gz ${ARCHIVE_DIR}
cd nginx-${NGINX_VERSION}

# Configure Nginx with the provided prefix
./configure --prefix=${PREFIX}

# Compile and install Nginx
make && make install



# The followings are steps to register nginx.service. Uncomment to activate.

# # Create the systemd service file
# cat > /etc/systemd/system/nginx.service <<EOF
# [Unit]
# Description=The NGINX HTTP and reverse proxy server
# After=network.target

# [Service]
# Type=forking
# PIDFile=${PREFIX}/logs/nginx.pid
# ExecStartPre=${PREFIX}/sbin/nginx -t
# ExecStart=${PREFIX}/sbin/nginx
# ExecReload=/bin/kill -s HUP \$MAINPID
# TimeoutStopSec=5
# KillMode=mixed

# [Install]
# WantedBy=multi-user.target
# EOF

# # Reload systemd to recognize the new service
# sudo systemctl daemon-reload

# # Enable and start the Nginx service
# sudo systemctl enable nginx
# sudo systemctl start nginx

# # Check the status of the Nginx service
# sudo systemctl status nginx


trap 'echo "Script interrupted. Returning to initial directory: ${INITIAL_CWD}"; cd "${INITIAL_CWD}"; exit' INT TERM EXIT