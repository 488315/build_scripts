#bin/bash
var=userdebug
device=karnak
d=$(date +%Y-%m-%d)
CM_VERSION=16.0
write=echo

$write "_ _                                              "
$write "| (_)_ __   ___  __ _  __ _  ___  ___  ___       "
$write "| | | '_ \\ / _ \\/ _\` |/ _\` |/ _ \\/ _ \\/ __|"
$write "| | | | | |  __/ (_| | (_| |  __/ (_) \\__ \\    "
$write "|_|_|_| |_|\\___|\\__,_|\\__, |\\___|\\___/|___/ "
$write "                      |___/                      "

export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

chmod +x build_kernel.sh
./build_kernel.sh

echo "building lineage_$device-$var $CM_VERSION"



echo "setting enviroment for $device"
source build/envsetup.sh



echo "adding $device to the lunch menu"
lunch lineage_$device-$var
echo "making logging directory"
rm -rf logd
mkdir logd



echo "now cooking some bacon...."
echo "WARNING: THIS MAY TAKE SOME TIME"

make bacon -j6 | tee logd/log-$d


