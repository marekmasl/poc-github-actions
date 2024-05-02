#!/bin/bash 

set -x

mkdir -p /opt/
cp ./arm-ca9-linux-gnueabihf-6.5.tar.bz2 /opt/
cd /opt/
bzip2 -d arm-ca9-linux-gnueabihf-6.5.tar.bz2
tar -xf ./arm-ca9-linux-gnueabihf-6.5.tar
rm ./arm-ca9-linux-gnueabihf-6.5.tar

STR=$'# Novatek na51068/nt98323 Cross-Toolchain path\nexport PATH="/opt/arm-ca9-linux-gnueabihf-6.5/usr/bin:$PATH"'
echo "$STR" >> /etc/profile

source /etc/profile
