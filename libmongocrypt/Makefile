#
# Copyright (C) 2010-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
PKG_NAME:=libmongocrypt
PKG_VERSION:=1.3.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/mongodb/libmongocrypt/archive/refs/tags/
PKG_HASH:=5ed15dc454add31b70361f7aacd217e0c58c755f97fed76c6fc2f8400d4a6730
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=COPYING

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/libkms_message
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libkms_message
  DEPENDS:=+libopenssl
endef

define Package/libmongocrypt
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libmongocrypt
  URL:=https://github.com/mongodb/libmongocrypt/
  DEPENDS:=+libbson +libkms_message
endef

CMAKE_OPTIONS += \
-DENABLE_SHARED_BSON=ON \
-DBUILD_VERSION=$(PKG_VERSION)

define Package/libmongocrypt/description
	The companion C library for client side encryption in drivers.
endef		

define Build/InstallDev
	$(INSTALL_DIR)			$(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/cmake	$(1)/opt/lib/
	$(INSTALL_DIR)						$(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/*	$(1)/opt/include
	$(INSTALL_DIR)			$(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/lib{kms_message,mongocrypt}*.{a,so*}	$(1)/opt/lib/
	$(INSTALL_DIR)						$(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/*.pc	$(1)/opt/lib/pkgconfig
endef

define Package/libmongocrypt/install
	$(INSTALL_DIR)			$(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libmongocrypt*.so*	$(1)/opt/lib/
endef

define Package/libkms_message/install
	$(INSTALL_DIR)			$(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libkms_message*.so*	$(1)/opt/lib/
endef

$(eval $(call BuildPackage,libmongocrypt))
$(eval $(call BuildPackage,libkms_message))
