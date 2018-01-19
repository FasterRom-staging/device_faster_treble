include build/make/target/product/aosp_arm64_ab.mk
$(call inherit-product, device/faster/treble/base.mk)
$(call inherit-product, device/faster/treble/gapps.mk)

# Device identifiers
PRODUCT_DEVICE := generic_arm64_ab
PRODUCT_NAME := faster_mata
PRODUCT_BRAND := essential
PRODUCT_MODEL := PH-1
PRODUCT_MANUFACTURER := Essential Products

USE_DEX2OAT_DEBUG := false

PRODUCT_BUILD_PROP_OVERRIDES += \
        PRODUCT_NAME=mata \
        BUILD_FINGERPRINT=essential/mata/mata:8.0.0/OPM1.170911.213/214:user/release-keys \
        PRIVATE_BUILD_DESC="mata-user 8.0.0 OPM1.170911.213 214 release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
	persist.service.adb.enable=1 \
	persist.service.debuggable=1

PRODUCT_COPY_FILES += \
	device/faster/treble/mata/lib/sensors.hal.tof.so:system/lib/sensors.hal.tof.so \
	device/faster/treble/mata/lib64/sensors.hal.tof.so:system/lib64/sensors.hal.tof.so
