# What is this
The scripts will altomatically download and install nginx.

# Before installation
remember to install base packages.
e.g. for Debian series(debian, ubuntu, linux mint, etc.):
```
sudo apt install -y build-essential libpcre3-dev libssl-dev zlib1g-dev
```
for RHEL series(centos, rocky-linux, almalinux, etc.):
```
sudo yum install -y gcc pcre pcre-devel zlib zlib-devel openssl openssl-devel
```

# How to use
The openssl and python will be installed at the same base directory by typing:
```
sh install.sh /path/u/wish/to/install
```
which leaves:

- ```/path/u/wish/to/install/nginx-1.21.6``` 
by default.

It would be nice to change the NGINX_VERSION in the ```install.sh``` in order to choose other versions according to certain preferences.
