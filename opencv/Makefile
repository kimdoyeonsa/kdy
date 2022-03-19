include $(TOPDIR)/rules.mk

PKG_NAME:=opencv
PKG_VERSION:=4.5.5
PKG_RELEASE:=$(AUTORELEASE)

PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/opencv/opencv/archive/refs/tags/
PKG_HASH:=a1cfdcf6619387ca9e232687504da996aaa9f7b5689986b8331ec02cb61d28ad

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1
PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/opencv
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=opencv
  URL:=https://opencv.org/
  DEPENDS:=+libopencv
endef

define Package/libopencv
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=opencv
  DEPENDS:=+libstdcpp +libtiff +libpng +libwebp +libjpeg-turbo +zlib +openblas 
endef

define Package/opencv/description
 Open Source Computer Vision Library
endef

define Build/InstallDev
	$(INSTALL_DIR)	$(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/*		$(1)/opt/include/
	$(INSTALL_DIR)	$(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libopencv*.so*	$(1)/opt/lib/
endef

define Package/opencv/install
	$(INSTALL_DIR)	$(1)/opt/bin
	$(CP) $(PKG_INSTALL_DIR)/opt/bin/*	$(1)/opt/bin/
endef

define Package/libopencv/install
	$(INSTALL_DIR)	$(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libopencv*.so*	$(1)/opt/lib/
endef

$(eval $(call BuildPackage,opencv))
$(eval $(call BuildPackage,libopencv))
