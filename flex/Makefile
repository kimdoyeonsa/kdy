#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Entware specific: 002-no-utility.patch removed, flac and utilities added
#

include $(TOPDIR)/rules.mk

PKG_NAME:=flex
PKG_VERSION:=2.6.4
KG_RELEASE:=1
NAME_PKG:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(NAME_PKG).tar.gz
PKG_SOURCE_URL:=https://github.com/westes/flex/files/981163/
PKG_HASH:=e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995

PKG_MAINTAINER:=Ted Hess <thess@kitschensync.net>
PKG_LICENSE:=GFDL-1.2 GPL-2 LGPL-2.1
PKG_LICENSE_FILES:=README
PKG_CPE_ID:=cpe:/a:flex:flex

PKG_FIXUP:=libtool
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/autotools.mk
prefix=/opt
define Package/libfl
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libfl
endef

define Package/flex
  SECTION:= utils
  CATEGORY:= Utilities
  TITLE:=flex
  DEPENDS:=+m4 +automake +libfl
endef


define Build/Compile
$(MAKE) -j4 -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" all
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/FlexLexer.h $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libfl.{a,la,so*} $(1)/opt/lib
endef

define Package/libfl/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libfl.{a,so*} $(1)/opt/lib
endef

define Package/flex/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/flex* $(1)/opt/bin
endef



$(eval $(call BuildPackage,flex))
$(eval $(call BuildPackage,libfl))

