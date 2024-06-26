# What is this
The scripts will altomatically download and install openssh and python. 
The installed openssl is involved as a lib of the installed python. This helps solve the "No module named _ssl" problem.
# How to use
The openssl and python will be installed at the same base directory by typing:
```
sh install.sh /path/u/wish/to/install
```
which leaves:
- ```/path/u/wish/to/install/openssl-3.3.1``` for openssl base path;
- ```/path/u/wish/to/install/Python-3.11.9``` for python base path;
- ```/path/u/wish/to/install/archives``` into which source tarballs will be moved.
The scripts will download openssl-3.3.1 and Python-3.11.9. It would be nice to change the download url in the ```install.sh``` in order to choose other versions according to certain preferences.

# After installation
The environment variables should be set.
e.g with python at /a/b/c/Python-3.11.9 and openssl at /a/b/c/openssl-3.3.1, following system environments are recommended:
```
export OPENSSL_3_3_1_PATH=/a/b/c/openssl-3.3.1
export LD_LIBRARY_PATH=$OPENSSL_3_3_1_PATH/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$OPENSSL_3_3_1_PATH/lib64/pkgconfig:$PKG_CONFIG_PATH

export PYTHON_3_11_PATH=/a/b/c/Python-3.11.9
export LD_LIBRARY_PATH=$PYTHON_3_11_PATH/lib:$LD_LIBRARY_PATH

```
The variable above are named intentionally to avoid conflicts with system environment variables.