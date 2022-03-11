# Path to zmk directory
ZMK_PATH:=/Users/tlietz/Developer/Keyboards/zmk

# microcontroller name
MCU:=nice_nano_v2

KEEB:=exkeylibur

MAKEFILE_PATH:=$(dir $(lastword $(MAKEFILE_LIST)))
FW:=zmk.uf2

default: clean left right

pristine: clean 
	cd ${ZMK_PATH}/app; \
	west build -p -b ${MCU} -- -DSHIELD=${KEEB}_left -DZMK_CONFIG="${MAKEFILE_PATH}/config"
	$(call copy_firmware,left)

left:
	$(call build,left)

right: 
	$(call build,right)

clean:
	rm -f ${MAKEFILE_PATH}/firmware/*${KEEB}*.uf2

define build
	cd ${ZMK_PATH}/app; \
	west build -b ${MCU} -- -DSHIELD=${KEEB}_$(1) -DZMK_CONFIG="${MAKEFILE_PATH}/config"
	$(call copy_firmware,$(1))
endef


define copy_firmware
	cp ${ZMK_PATH}/app/build/zephyr/${FW} ${MAKEFILE_PATH}/firmware
	cd ${MAKEFILE_PATH}/firmware; \
	mv ${FW} ${KEEB}_$(1).uf2 
endef