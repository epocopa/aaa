# List of apps and optional libraries (Java and native) to put in the add-on system image.
PRODUCT_PACKAGES := \
	PlatformLibraryClient \
	com.example.android.platform_library \
	libplatform_library_jni

# name of the add-on
PRODUCT_SDK_ADDON_NAME := platform_library

# Copy the manifest and hardware files for the SDK add-on.
# The content of those files is manually created for now.
PRODUCT_SDK_ADDON_COPY_FILES := \
    device/sample/sdk_addon/manifest.ini:manifest.ini \
    device/sample/sdk_addon/hardware.ini:hardware.ini \
	$(call find-copy-subdir-files,*,device/sample/skins/WVGAMedDpi,skins/WVGAMedDpi)


# Add this to PRODUCT_SDK_ADDON_COPY_FILES to copy the files for an
# emulator skin (or for samples)
#$(call find-copy-subdir-files,*,device/sample/skins/WVGAMedDpi,skins/WVGAMedDpi)

# Copy the jar files for the optional libraries that are exposed as APIs.
PRODUCT_SDK_ADDON_COPY_MODULES := \
    com.example.android.platform_library:libs/platform_library.jar

# Rules for public APIs
PRODUCT_SDK_ADDON_STUB_DEFS := $(LOCAL_PATH)/addon_stub_defs

# Name of the doc to generate and put in the add-on. This must match the name defined
# in the optional library with the tag
#    LOCAL_MODULE:= platform_library
# in the documentation section.
PRODUCT_SDK_ADDON_DOC_MODULES := platform_library

# This add-on extends the arm emulator/sdk product.
$(call inherit-product, $(SRC_TARGET_DIR)/product/sdk_phone_armv7.mk)

# Real name of the add-on. This is the name used to build the add-on.
# Use 'lunch <PRODUCT_NAME>-userdebug; m sdk_addon' to build the add-on.
PRODUCT_NAME := sample_addon
