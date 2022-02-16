#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Entware specific: 002-no-utility.patch removed, flac and utilities added
#

include $(TOPDIR)/rules.mk

PKG_NAME:=freetds
PKG_VERSION:=1.3.9
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.freetds.org/pub/freetds/stable/
PKG_HASH:=923dff0c8cf258ef33d661d71bf431ffb55218f14e0026f75d361951c2e92dbb

PKG_MAINTAINER:=Ted Hess <thess@kitschensync.net>
PKG_LICENSE:=GFDL-1.2 GPL-2 LGPL-2.1
PKG_LICENSE_FILES:=README
PKG_CPE_ID:=cpe:/a:freetds:freetds

PKG_FIXUP:=libtool
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/freetds/Default
  SECTION:= utils
  CATEGORY:= Utilities
  DEPENDS:=+libfreetds +libreadline
endef

define Package/libfreetds
 SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=freetds
  DEPENDS:=+libopenssl +unixodbc +krb5-libs
endef

define Package/freetds
  $(call Package/freetds/Default)
  TITLE:=freetds
  
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/* $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/lib*.{so*,a} $(1)/opt/lib/
endef

define Package/freetds/install
	$(INSTALL_DIR) $(1)/opt/bin/
	$(CP) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin/
endef

define Package/libfreetds/install
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/lib*.{so*,a} $(1)/opt/lib/
endef

$(eval $(call BuildPackage,freetds))
$(eval $(call BuildPackage,libfreetds))

