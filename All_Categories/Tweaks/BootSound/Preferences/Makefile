#TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk
export THEOS_PACKAGE_SCHEME=rootless

BUNDLE_NAME = BootSoundPrefs

$(BUNDLE_NAME)_FILES = $(wildcard Controllers/*.m)
$(BUNDLE_NAME)_FRAMEWORKS = UIKit CoreGraphics AudioToolbox
$(BUNDLE_NAME)_PRIVATE_FRAMEWORKS = Preferences
$(BUNDLE_NAME)_EXTRA_FRAMEWORKS += Cephei CepheiPrefs
$(BUNDLE_NAME)_INSTALL_PATH = /Library/PreferenceBundles
$(BUNDLE_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
