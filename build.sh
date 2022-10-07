#!/bin/bash

###versions

nginx_version="1.23.1"
module_version="2.3"

# build nginx module
echo "build with nginx version $nginx_version"

# download nginx binary from nginx.org
wget http://nginx.org/download/nginx-$nginx_version.tar.gz

# extract
tar xfv nginx-$nginx_version.tar.gz

# download module source
wget https://github.com/FRiCKLE/ngx_cache_purge/archive/refs/tags/$module_version.tar.gz
ls -la

# extract
tar xfv ngx_cache_purge-$module_version.tar.gz

# cd
cd nginx-$nginx_version

# ./configure
./configure --with-compat --add-dynamic-module=../ngx_cache_purge-$module_version/ --with-cc-opt=-Wno-stringop-overread

# make
make

# make install
make install

#debug
pwd
ls -la
ls -la objs


# copy module to module directory
cp objs/*.so /module/.

exit 0
