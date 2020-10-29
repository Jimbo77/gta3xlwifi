#!/bin/bash -x

rm -rf $(pwd)/out/Image.gz

export ARCH=arm64

make mrproper

mkdir out

export CROSS_COMPILE=$(pwd)/toolchains/gcc-linaro-4.9.4-2017.01-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
export ANDROID_MAJOR_VERSION=q
export CLANG_TRIPLE=aarch64-linux-gnu-

make exynos7885-gta3xlwifi_defconfig
make -j$(nproc)

cp arch/$ARCH/boot/Image.gz $(pwd)/out/Image.gz

#make mrproper
