#!/bin/bash
clear
var=userdebug
device=karnak
# unexport _JAVA_OPTIONS of availible in .bashrc
if  $_JAVA_OPTIONS
then
export -n _JAVA_OPTIONS
fi
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"
echo "[BUILD] Building lineage_$device-$var"
echo "[ENVIROMENT] Setting Enviroment for $device"
source build/envsetup.sh
# prevent from the kernel build counting up the numbers
rm -rf out/target/product/$device/obj/KERNEL_OBJ/.version
rm -rf out/target/product/$device/obj/KERNEL_OBJ/.config.old
echo "[BUILD] Adding $device to the lunch menu"
lunch lineage_$device-$var
#make installclean and then make bacon. make clean is implemented because to fix vendor image mismatch
cmka bacon

