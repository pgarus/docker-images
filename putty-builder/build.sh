#!/bin/bash

PUTTY_SRC_LINK="https://the.earth.li/~sgtatham/putty/0.76/putty-0.76.tar.gz"
PUTTY_FILECONFIG_LINK="http://jakub.kotrla.net/putty/portable_putty_076_0.18.0_all_in_one.zip"

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

cd `ls -d */ | head -n1`

cp winpgnt.c winstore.c ../../$PUTTY_DIR_NAME/windows

cd ..
cd ..
rm -rf fileconfig

cd $PUTTY_DIR_NAME

if [ "${USE_PATCHES,,}" == "y" ]; then
	ls -1 ../patches/*.patch | xargs -I{} sh -c "cat {} | patch -p1 -l"
fi

./mkfiles.pl

cd windows

make -f Makefile.mgw
mv *.exe /dist

cd /build
rm -rf $PUTTY_DIR_NAME

