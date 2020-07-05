ARCHS=arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = cliboardPro
TARGET = iphone::clang10.3:10.3
DEBUG=1
cliboardPro_FILES = Tweak.x
cliboardPro_FRAMEWORKS = UserNotifications
cliboardPro_OBJ_FILES=libMBProgressHUD.a



include $(THEOS_MAKE_PATH)/tweak.mk
