#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Entware specific: 002-no-utility.patch removed, flac and utilities added
#

include $(TOPDIR)/rules.mk

PKG_NAME:=bison
PKG_VERSION:=3.8.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://ftp.gnu.org/gnu/bison/
PKG_HASH:=9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2

PKG_MAINTAINER:=Ted Hess <thess@kitschensync.net>
PKG_LICENSE:=GFDL-1.2 GPL-2 LGPL-2.1
PKG_LICENSE_FILES:=README
PKG_CPE_ID:=cpe:/a:gnuproject:bison

# PKG_FIXUP:=aclocal.m4
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/bison
  SECTION:= utils
  CATEGORY:= Utilities
  TITLE:=bison
  URL:=
  DEPENDS:=+m4
endef

define Build/Compile
+$(MAKE) -C $(PKG_BUILD_DIR) \
all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/liby.a $(1)/opt/lib
endef

define Package/bison/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin
	$(INSTALL_DIR) $(1)/opt/info
	$(CP) $(PKG_INSTALL_DIR)/opt/info/* $(1)/opt/info
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/liby.a $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/man
	$(CP) $(PKG_INSTALL_DIR)/opt/man/man1 $(1)/opt/man
	$(INSTALL_DIR) $(1)/opt/share
	$(CP) $(PKG_INSTALL_DIR)/opt/share/* $(1)/opt/share
endef	



$(eval $(call BuildPackage,bison))
