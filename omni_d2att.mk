
# Inherit from common
$(call inherit-product, device/samsung/d2-common/omni.mk)

$(call inherit-product, device/samsung/d2att/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := d2att
PRODUCT_NAME := omni_d2att
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SGH-I747
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone

PRODUCT_GMS_CLIENTID_BASE := android-samsung
