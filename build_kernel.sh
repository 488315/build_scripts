#build kernel here
cd kernel/amazon
make -C karnak  O=../KERNEL_OUT  ARCH=arm64 CROSS_COMPILE=../aarch64-linux-android-4.9/bin/aarch64-linux-android- karnak_defconfig
make O=../KERNEL_OUT/ -C karnak ARCH=arm64  CROSS_COMPILE=../aarch64-linux-android-4.9/bin/aarch64-linux-android- -j8
cp -rv KERNEL_OUT/arch/arm64/boot/Image.gz-dtb  ../../device/amazon/karnak/prebuilt/
cd ~/android/lineage16
