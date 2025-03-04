#!/bin/sh
#
# Build the bootloader.
#

ABSPATH=$(readlink -f $0)
BASEDIR=$(dirname "$ABSPATH")

cd $BASEDIR || exit 1

rm -rf build

west build -b rpi_pico2/rp2350a/m33 ../../../bootloader/mcuboot/boot/zephyr \
           -- -DDTC_OVERLAY_FILE="$BASEDIR"/rpi_pico2/rp2350a/m33.overlay \
              -DOVERLAY_CONFIG="$BASEDIR"/rpi_pico2/rp2350a/m33.conf