after installation, the environment variables should be set.
e.g with python at /a/b/c/Python-3.11.9 and openssl at /a/b/c/openssl-3.3.1, following system environments are recommended:
```
export OPENSSL_3_3_1_PATH=/a/b/c/openssl-3.3.1
export PYTHON_3_11_PATH=/a/b/c/Python-3.11.9 
export LD_LIBRARY_PATH=$OPENSSL_3_3_1_PATH/lib:$PYTHON_3_11_PATH/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$OPENSSL_3_3_1_PATH/lib64/pkgconfig:$PKG_CONFIG_PATH
```
The variable above are named intentionally to avoid conflicts with system environment variables.