# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit common TWRP/AERA recovery configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from ruby device
$(call inherit-product, device/xiaomi/ruby/device.mk)

# Inherit AERA-specific ruby settings
$(call inherit-product, device/xiaomi/ruby/aera_ruby.mk)

# Configure virtual AB OTA features
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/vabc_features.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

PRODUCT_RELEASE_NAME := ruby

PRODUCT_DEVICE := ruby
PRODUCT_NAME := twrp_$(PRODUCT_DEVICE)
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi Note 12 Pro 5G
PRODUCT_MANUFACTURER := xiaomi

TARGET_OTA_ASSERT_DEVICE := ruby,ruby_pro,rubypro,ruby_plus,rubyplus,rubyx

PRODUCT_GMS_CLIENTID_BASE := android-$(PRODUCT_MANUFACTURER)

# Wi-Fi & Network Packages
PRODUCT_PACKAGES += \
    wpa_supplicant \
    wpa_cli \
    wpa_supplicant.conf \
    dhcpcd \
    ip \
    iw

# Audio Packages & Utilities
PRODUCT_PACKAGES += \
    tinyalsa \
    tinymix \
    tinyplay \
    tinycap \
    libtinyalsa
