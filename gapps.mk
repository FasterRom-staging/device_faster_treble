# Include GAPPS by default
GAPPS_VARIANT := pico
GAPPS_FORCE_MMS_OVERRIDES := true
GAPPS_FORCE_DIALER_OVERRIDES := true
GAPPS_FORCE_BROWSER_OVERRIDES := true
$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)
