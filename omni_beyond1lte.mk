$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/beyond2lte/device.mk)

### BOOTANIMATION
# vendor/omni/config/common_full_phone.mk
TARGET_SCREEN_HEIGHT := 3040
TARGET_SCREEN_WIDTH := 1440
# vendor/omni/config/common.mk
TARGET_BOOTANIMATION_HALF_RES := true

### OMNI
$(call inherit-product, vendor/omni/config/common.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := omni_beyond2lte
PRODUCT_DEVICE := beyond2lte
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := SM-G975F
PRODUCT_MANUFACTURER := Samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=beyond2lte \
    PRIVATE_BUILD_DESC="beyond2ltexx-user 10 QP1A.190711.020 G970FXXU4BTA8 release-keys"

BUILD_FINGERPRINT := samsung/beyond2ltexx/beyond2:10/QP1A.190711.020/G970FXXU4BTA8:user/release-keys

ifneq ($(OMNI_DEV_CERTIFICATE),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := $(OMNI_DEV_CERTIFICATE)
endif
