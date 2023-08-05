#!/bin/bash
source halium.env
cd $ANDROID_ROOT


source build/envsetup.sh
bash hybris-patches/apply-patches.sh --mb
export USE_CCACHE=1
breakfast $DEVICE
mka mkbootimg
export USE_HOST_LEX=yes
mka hybris-boot
mka systemimage
