#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Entware specific: 002-no-utility.patch removed, flac and utilities added
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hunspell
PKG_VERSION:=1.7.0
PKG_RELEASE:=1

PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/hunspell/hunspell/archive/refs/tags/
PKG_HASH:=bb27b86eb910a8285407cf3ca33b62643a02798cf2eef468c0a74f6c3ee6bc8a

PKG_MAINTAINER:=Ted Hess <thess@kitschensync.net>
PKG_LICENSE:=GFDL-1.2 GPL-2 LGPL-2.1
PKG_LICENSE_FILES:=README


PKG_FIXUP:=autoreconf -vfi
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1


include $(INCLUDE_DIR)/package.mk

define Package/nuspell/description
endef
define Package/libhunspell
    SECTION:=libs
    CATEGORY:=Libraries
    TITLE:=libhunspell
    DEPENDS:=+libstdcpp
endef

define Package/hunspell
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=nuspell
  DEPENDS:=+libhunspell
endef


define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/hunspell
	$(CP) $(PKG_INSTALL_DIR)/opt/include/hunspell/* $(1)/opt/include/hunspell
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libhunspell*.{so*,la,a} $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib//pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/hunspell.pc $(1)/opt/lib/pkgconfig/
endef

define Package/libhunspell/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libhunspell*.{so*,la,a} $(1)/opt/lib/
endef

define Package/hunspell/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin
endef



$(eval $(call BuildPackage,hunspell))
$(eval $(call BuildPackage,libhunspell))

