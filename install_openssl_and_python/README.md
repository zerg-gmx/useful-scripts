# What is this
The scripts will altomatically download and install openssh and python. 

The installed openssl is involved as a lib of the installed python. This helps solve the "No module named _ssl" problem.
# Before installation
remember to install base packages.
e.g. for Debian series(debian, ubuntu, linux mint, etc.):
```
sudo apt-get install build-essential -y
```
for RHEL series(centos, rocky-linux, almalinux, etc.):
```
sudo yum groupinstall "Development Tools" -y
sudo yum install -y cmake gcc-c++ kernel-devel
```

# How to use
The openssl and python will be installed at the same base directory by typing:
```
sh install.sh /path/u/wish/to/install
```
which leaves:

- ```/path/u/wish/to/install/openssl-3.3.1``` for openssl base path;
- ```/path/u/wish/to/install/Python-3.12.4``` for python base path;
- ```/path/u/wish/to/install/archives``` into which source tarballs will be moved.

The scripts will download openssl-3.3.1 and Python-3.12.4. It would be nice to change the download urls in the ```install.sh``` in order to choose other versions according to certain preferences.

# After installation
The environment variables should be set.
e.g with python at /path/u/wish/to/install/Python-3.12.4 and openssl at /path/u/wish/to/install/openssl-3.3.1, following system environments are recommended:
```
export OPENSSL_3_3_1_PATH=/path/u/wish/to/install/openssl-3.3.1
export LD_LIBRARY_PATH=$OPENSSL_3_3_1_PATH/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$OPENSSL_3_3_1_PATH/lib64/pkgconfig:$PKG_CONFIG_PATH

export PYTHON_3_12_PATH=/path/u/wish/to/install/Python-3.12.4
export LD_LIBRARY_PATH=$PYTHON_3_12_PATH/lib:$LD_LIBRARY_PATH

```
The variables above are named intentionally to avoid conflicts with system environment variables.
