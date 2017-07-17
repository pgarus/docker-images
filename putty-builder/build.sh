#!/bin/bash

read -e -p "PuTTY source link: " -i "https://the.earth.li/~sgtatham/putty/0.70/putty-0.70.tar.gz" PUTTY_SRC_LINK
read -e -p "Jakub Kotrla patched PuTTY link: " -i "http://jakub.kotrla.net/putty/portable_putty_068_0.11.0_all_in_one.zip" PUTTY_FILECONFIG_LINK
read -e -p "Use additional patches? [yN] " -n 1 USE_PATCHES

set -ex

rm -rf /dist/*

cd /build

curl "$PUTTY_SRC_LINK" | tar xz
PUTTY_DIR_NAME=`ls -d putty-*/ | head -n1`

mkdir -p fileconfig
cd fileconfig

curl -O "$PUTTY_FILECONFIG_LINK"
unzip *.zip
cp winpgnt.c winstore.c ../$PUTTY_DIR_NAME/windows

cd ..
rm -rf fileconfig

cd $PUTTY_DIR_NAME

if [ "${USE_PATCHES,,}" == "y" ]; then
	ls -1 ../patches/*.patch | xargs -I{} sh -c "cat {} | patch -p1"
fi

./mkfiles.pl

cd windows

make -f Makefile.mgw
mv *.exe /dist

cd /build
rm -rf $PUTTY_DIR_NAME

