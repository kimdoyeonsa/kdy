#
# Copyright (C) 2010-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk


PKG_NAME:=libfastlz
PKG_VERSION:=0.1
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
PKG_SOURCE_URL:=http://puga.vdu.lt/debian/dists/unstable/main/source/libf/$(PKG_NAME)
PKG_HASH:=881a8bb63c28c26c0cd8f99473a503ff3b98ff05263474ef794b1d5131e2dffe
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1
PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
 
define Package/fastlzcat
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=fastlzcat
  DEPENDS:=+libfastlz
endef
 
define Package/libfastlz
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libfastlz
  URL:=http://puga.vdu.lt/debian/dists/unstable/main/source/libf/libfastlz
endef

define Package/libfastlz/description
 The focus for FastLZ is a very fast compression and decompression
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/*.h $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libfastlz.{a,la,so*} $(1)/opt/lib
endef

define Package/libfastlz/install
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/*.h $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libfastlz.{a,la,so*} $(1)/opt/lib
endef

define Package/fastlzcat/install
	$(INSTALL_DIR) $(1)/opt/bin/
	$(CP) $(PKG_INSTALL_DIR)/opt/bin/fastlzcat $(1)/opt/bin
endef

$(eval $(call BuildPackage,fastlzcat))
$(eval $(call BuildPackage,libfastlz))
