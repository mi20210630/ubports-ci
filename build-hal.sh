#!/bin/bash
source halium.env
cd $ANDROID_ROOT
sudo apt install git gnupg flex bison gperf build-essential \
zip bzr curl libc6-dev libncurses5-dev:i386 x11proto-core-dev \
libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 \
libgl1-mesa-dev g++-multilib mingw-w64-i686-dev tofrodos \
python3-markdown libxml2-utils xsltproc zlib1g-dev:i386 schedtool \
liblz4-tool bc lzop imagemagick libncurses5 rsync \
python-is-python3 python2
sudo apt -y install mkbootimg
source build/envsetup.sh
bash hybris-patches/apply-patches.sh --mb
export USE_CCACHE=1
#breakfast $DEVICE
#grep "TARGET_KERNEL_CONFIG" device/<VENDOR>/<CODENAME>/BoardConfig.mk
./halium/halium-boot/check-kernel-config device/xiaomi/cereus/BoardConfig.mk -w
./halium/halium-boot/check-kernel-config device/xiaomi/cereus/BoardConfig.mk -w
./halium/halium-boot/check-kernel-config device/xiaomi/cereus/BoardConfig.mk
breakfast $DEVICE
mka mkbootimg
export USE_HOST_LEX=yes
mka halium-boot
#mka hybris-boot
#mka systemimage
