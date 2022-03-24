#
# Copyright (C) 2010-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
PKG_NAME:=mongo-c-driver
PKG_VERSION_MAJOR:=1.21
PKG_VERSION:=$(PKG_VERSION_MAJOR).1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/mongodb/mongo-c-driver/releases/download/$(PKG_VERSION)/
PKG_HASH:=2dd10399a31108116236ada68ae6d3f4b1bf78c03b43b1a33933d42aa0e62ed4
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=COPYING

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/libbson
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libbson
endef

define Package/mongo-c-driver
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libmongoc
  URL:=https://github.com/mongodb/mongo-c-driver/
  DEPENDS:=+libsnappy +icu +libsasl2 +libzstd +libopenssl +zlib +libbson +libmongocrypt
endef

CMAKE_OPTIONS += \
-DENABLE_MAINTAINER_FLAGS=ON \
-DENABLE_CRYPTO_SYSTEM_PROFILE=ON \
-DENABLE_COVERAGE=ON \
-DENABLE_DEBUG_ASSERTIONS=ON

define Package/mongo-c-driver/description
	A high-performance MongoDB driver for C
endef		

define Build/InstallDev
	$(INSTALL_DIR)			$(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/cmake	$(1)/opt/lib/
	$(INSTALL_DIR)						$(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/*	$(1)/opt/include
	$(INSTALL_DIR)			$(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/lib{bson,mongoc}*.{a,so*}	$(1)/opt/lib/
	$(INSTALL_DIR)						$(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/*.pc	$(1)/opt/lib/pkgconfig

endef

define Package/libbson/install
	$(INSTALL_DIR)			$(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libbson*.so*	$(1)/opt/lib/
endef

define Package/mongo-c-driver/install
	$(INSTALL_DIR)			$(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libmongoc*.so*	$(1)/opt/lib/
endef

$(eval $(call BuildPackage,libbson))
$(eval $(call BuildPackage,mongo-c-driver))
