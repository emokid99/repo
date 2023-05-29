export ARCHS = arm64 arm64e
export TARGET = iphone:clang:15.2:13.0
export SYSROOT = $(THEOS)/sdks/iPhoneOS15.2.sdk
export THEOS_PACKAGE_SCHEME=rootless
# export PREFIX = $(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/
#import <rootles.h>

INSTALL_TARGET_PROCESSES = SpringBoard
SUBPROJECTS = Tweak Preferences

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
