#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <install_base_path>"
    exit 1
fi


# The following two urls are for openssl and python. Change the download url if necessary.
export TMP_CUR_OPENSSL_URL="https://github.com/openssl/openssl/releases/download/openssl-3.3.1/openssl-3.3.1.tar.gz"
export TMP_CUR_PYTHON_URL="https://www.python.org/ftp/python/3.11.9/Python-3.11.9.tgz"


chmod +x do_install
SCRIPT_DIR=$(dirname "$0")
$SCRIPT_DIR/do_install $1 > "$SCRIPT_DIR/stdout.log" 2> "$SCRIPT_DIR/stderr.log"
unset TMP_CUR_OPENSSL_URL
unset TMP_CUR_PYTHON_URL
