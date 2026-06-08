
define Device/Default
  FILESYSTEMS := ext4
  IMAGES := emmc_burn.img
  KERNEL_DEPENDS = $$(wildcard $(DTS_DIR)/$$(DEVICE_DTS).dts)
  KERNEL_LOADADDR := 0x01080000
  KERNEL_NAME := Image
  KERNEL := kernel-bin | uImage none
  PROFILES = Default $$(DEVICE_NAME)
  DEVICE_DTS_DIR := $(DTS_DIR)/amlogic
  DEVICE_DTS = $$(SOC)-$(subst _,-,$(1))
endef

define Device/thunder-onecloud
  DEVICE_DTS := meson8b-onecloud
  DEVICE_TITLE := OneCloud 玩客云
  DEVICE_PACKAGES += kmod-usb-net-rtl8152
  KERNEL_LOADADDR := 0x00208000
  IMAGE/emmc_burn.img := boot-script onecloud | emmc-common $$(DEVICE_NAME)
endef
TARGET_DEVICES += thunder-onecloud

define Image/Build
  	export BIN_DIR=$(BIN_DIR); \
  	cd /data/packit/openwrt-onecloud; \
  	. ~/packit/packit_onecloud1.sh || true
endef
