# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.20.0)

set(BOARD rpi_pico2/rp2350a/m33)

if (CONSOLE STREQUAL uart1)
    list(APPEND EXTRA_DTC_OVERLAY_FILE "uart1.overlay")
endif()

if (MCUBOOT STREQUAL enable)
    list(APPEND EXTRA_DTC_OVERLAY_FILE "mcuboot.overlay")
    list(APPEND EXTRA_CONF_FILE "mcuboot.conf")
endif()

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(scsat1-rpi-pico)

target_sources(app PRIVATE
	src/main.c
	src/temp.c
	src/pico_csp.c
)