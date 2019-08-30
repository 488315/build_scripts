#build kernel here
cd kernel/amazon
echo "cleaning the out directory of the kernel"
rm -rf KERNEL_OUT
mkdir -p KERNEL_OUT
echo "all done now im loading the defconfig for $device"
make -C karnak  O=../KERNEL_OUT  ARCH=arm64 CROSS_COMPILE=../aarch64-linux-android-4.9/bin/aarch64-linux-android- karnak_defconfig
echo "defconfig loaded!"
echo "entering make"
make O=../KERNEL_OUT/ -C karnak ARCH=arm64  CROSS_COMPILE=../aarch64-linux-android-4.9/bin/aarch64-linux-android- -j8
echo "kernel build finished and now copying the kernel to the prebuilts folder"
cp -rv KERNEL_OUT/arch/arm64/boot/Image.gz-dtb  ../../device/amazon/prebuilts/kernel
echo "leaving the kernel directory and entering make for karnak-lineage16"
cd ~/android/lineage16
