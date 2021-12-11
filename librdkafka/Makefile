#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Entware specific: 002-no-utility.patch removed, flac and utilities added
#

include $(TOPDIR)/rules.mk

PKG_NAME:=librdkafka
PKG_VERSION:=1.6.2
PKG_RELEASE:=1

PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/edenhill/librdkafka/archive/refs/tags/
PKG_HASH:=b9be26c632265a7db2fdd5ab439f2583d14be08ab44dc2e33138323af60c39db

PKG_MAINTAINER:=Ted Hess <thess@kitschensync.net>
PKG_LICENSE:=GFDL-1.2 GPL-2 LGPL-2.1
PKG_LICENSE_FILES:=README


# PKG_FIXUP:=autoconf
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS += $(FPIC)
	
define Package/rdkafka/description
  KAFKA is a registered trademark of The Apache Software Foundation and has been licensed for use by librdkafka. librdkafka has no affiliation with and is not endorsed by The Apache Software Foundation.
endef


define Package/librdkafka
    SECTION:=libs
    CATEGORY:=Libraries
    TITLE:=rdkafka
    DEPENDS:=+libopenssl +libsasl2 +libsasl2-sasldb +liblz4 +zlib-dev +libzstd +rapidjson +libstdcpp
endef

CONFIGURE_PREFIX:=/opt
CONFIGURE_ARGS = \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=$(CONFIGURE_PREFIX) \
		--exec-prefix=$(CONFIGURE_PREFIX) \
		--bindir=$(CONFIGURE_PREFIX)/bin \
		--sbindir=$(CONFIGURE_PREFIX)/sbin \
		--libexecdir=$(CONFIGURE_PREFIX)/lib \
		--sysconfdir=$(CONFIGURE_PREFIX)/etc \
		--datadir=$(CONFIGURE_PREFIX)/share \
		--localstatedir=$(CONFIGURE_PREFIX)/var \
		--mandir=$(CONFIGURE_PREFIX)/man \
		--infodir=$(CONFIGURE_PREFIX)/info
		
                  
define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/librdkafka
	$(CP) $(PKG_INSTALL_DIR)/opt/include/librdkafka/*.h $(1)/opt/include/librdkafka
	$(INSTALL_DIR) $(1)/opt/lib
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/opt/lib/librdkafka.{so*,a} $(1)/opt/lib
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/opt/lib/librdkafka++.{so*,a} $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/*.pc $(1)/opt/lib/pkgconfig
endef


define Package/librdkafka/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/opt/lib/librdkafka.{so*,a} $(1)/opt/lib
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/opt/lib/librdkafka++.{so*,a} $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/*.pc $(1)/opt/lib/pkgconfig
endef

$(eval $(call BuildPackage,librdkafka))


