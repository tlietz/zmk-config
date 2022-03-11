# Path to zmk/app directory
ZMK_PATH := /Users/tlietz/Developer/Keyboards/zmk/app

# microcontroller name
MCU := nice_nano_v2

KEEB := exkeylibur

CONFIG := "$(shell pwd)/config" 

.PHONY: left right

left: 
	cd ${ZMK_PATH}; \
	west build -b ${MCU} -- -DSHIELD=${KEEB}_left -DZMK_CONFIG=${CONFIG}


