#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Entware specific: 002-no-utility.patch removed, flac and utilities added
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nuspell
PKG_VERSION:=5.0.0
PKG_RELEASE:=1

PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/nuspell/nuspell/archive/refs/tags/
PKG_HASH:=855d4771d225dcce1e48d098be6a2d69629c635b79b53f9e095a35adc68f0ea1

PKG_MAINTAINER:=Ted Hess <thess@kitschensync.net>
PKG_LICENSE:=GFDL-1.2 GPL-2 LGPL-2.1
PKG_LICENSE_FILES:=README


PKG_FIXUP:=autoconf
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk
define Package/nuspell/description
endef
define Package/libnuspell
    SECTION:=libs
    CATEGORY:=Libraries
    TITLE:=libnuspell
    DEPENDS:=+icu-full-data +icu
endef

define Package/nuspell
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=nuspell
  DEPENDS:=+libnuspell
endef


define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/nuspell/
	$(CP) $(PKG_INSTALL_DIR)/opt/include/nuspell/* $(1)/opt/include/nuspell
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libnuspell.so* $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig	
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/nuspell.pc $(1)/opt/lib/pkgconfig
endef

define Package/libnuspell/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libnuspell.so* $(1)/opt/lib/
endef

define Package/nuspell/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(CP) $(PKG_INSTALL_DIR)/opt/bin/nuspell $(1)/opt/bin/
endef



$(eval $(call BuildPackage,nuspell))
$(eval $(call BuildPackage,libnuspell))

