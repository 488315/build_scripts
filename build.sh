#!/bin/bash
clear
var=userdebug
device=karnak

# Unset _JAVA_OPTIONS if it's set
if [[ ! -z "${_JAVA_OPTIONS+x}" ]]; then
  unset _JAVA_OPTIONS
fi

ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

echo "[BUILD] Building lineage_$device-$var"
echo "[ENVIRONMENT] Setting Environment for $device"
source build/envsetup.sh

# Prevent kernel build from counting up the numbers
rm -rf "out/target/product/$device/obj/KERNEL_OBJ/.version"
rm -rf "out/target/product/$device/obj/KERNEL_OBJ/.config.old"

echo "[BUILD] Adding $device to the lunch menu"
lunch "lineage_$device-$var"

# Use cmka to build with 'bacon' target
cmka bacon
