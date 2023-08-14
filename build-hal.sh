#!/bin/bash
source halium.env
cd $ANDROID_ROOT
#sudo apt -y install mkbootimg
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
cp /home/runner/work/halium/out/host/linux-x86/bin/mkbootimg ~/bin
chmod a+x ~/bin/mkbootimg
export USE_HOST_LEX=yes
mka halium-boot
#mka hybris-boot
#mka systemimage
