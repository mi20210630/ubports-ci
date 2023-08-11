#!/bin/bash
source halium.env
cd $ANDROID_ROOT


source build/envsetup.sh
bash hybris-patches/apply-patches.sh --mb
export USE_CCACHE=1
breakfast $DEVICE
#grep "TARGET_KERNEL_CONFIG" device/<VENDOR>/<CODENAME>/BoardConfig.mk
./halium/halium-boot/check-kernel-config device/xiaomi/cereus/BoardConfig.mk -w
./halium/halium-boot/check-kernel-config device/xiaomi/cereus/BoardConfig.mk -w
./halium/halium-boot/check-kernel-config device/xiaomi/cereus/BoardConfig.mk
mka mkbootimg
export USE_HOST_LEX=yes
mka halium-boot
mka hybris-boot
mka systemimage
