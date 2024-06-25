#!/bin/bash

# Author: zergling-gmx

# Export URLs for OpenSSL and Python
export TMP_CUR_OPENSSL_URL="https://github.com/openssl/openssl/releases/download/openssl-3.3.1/openssl-3.3.1.tar.gz"
export TMP_CUR_PYTHON_URL="https://www.python.org/ftp/python/3.11.9/Python-3.11.9.tgz"


chmod +x do_install
SCRIPT_DIR=$(dirname "$0")
./do_install $1 > "$SCRIPT_DIR/stdout.log" 2> "$SCRIPT_DIR/stderr.log"
unset TMP_CUR_OPENSSL_URL
unset TMP_CUR_PYTHON_URL
