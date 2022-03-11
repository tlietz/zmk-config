# Path to zmk directory
ZMK_PATH:=/Users/tlietz/Developer/Keyboards/zmk

# microcontroller name
MCU:=nice_nano_v2

KEEB:=exkeylibur

MAKEFILE_PATH:=$(dir $(lastword $(MAKEFILE_LIST)))

.PHONY: left right

left: 
	cd ${ZMK_PATH}/app; \
	west build -b ${MCU} -- -DSHIELD=${KEEB}_left -DZMK_CONFIG="${MAKEFILE_PATH}/config"


