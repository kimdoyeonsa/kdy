#
# Copyright (C) 2010-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
PKG_NAME:=libmemcached
PKG_VERSION_MAJOR:=1.0
PKG_VERSION:=$(PKG_VERSION_MAJOR).18
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://launchpad.net/libmemcached/$(PKG_VERSION_MAJOR)/$(PKG_VERSION)/+download
PKG_HASH:=e22c0bb032fde08f53de9ffbc5a128233041d9f33b5de022c0978a2149885f82
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_FIXUP:=autoreconf
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=COPYING

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libmemcached
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libmemcached
  URL:=libmemcached.org
  DEPENDS:=+libstdcpp +libsasl2
endef

define Package/memcachedutil
  SECTION:= utils
  CATEGORY:= Utilities
  TITLE:=memcachedutil
  DEPENDS:=+libmemcached
endef

define Package/libmemcached/description
	C/C++ client library and tools for the memcached server 
endef

CONFIGURE_ARGS+= \
		--enable-shared \
		--enable-static \
		--enable-hsieh_hash \
		--enable-assert \
		--enable-sasl \
		--enable-dependency-tracking \
		--enable-libmemcachedprotocol \
		--enable-memaslap
		
define Build/Prepare
	$(Build/Prepare/Default)
	( cp ./files/configure.patch $(PKG_BUILD_DIR); )
endef


define Build/Configure
        ( cd $(PKG_BUILD_DIR); ./bootstrap.sh patch configure<configure.patch; ./configure $(CONFIGURE_ARGS) )
endef

define Build/Compile
	$(MAKE) -j4 -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" install
endef	

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/
	$(CP) $(PKG_INSTALL_DIR)/opt/include/* $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.{a,so*,la} $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/libmemcached.pc $(1)/opt/lib/pkgconfig/
endef

define Package/libmemcached/install
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.so* $(1)/opt/lib/
endef

define Package/memcachedutil/install
	$(INSTALL_DIR) $(1)/opt/bin/
	$(CP) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin/
endef

$(eval $(call BuildPackage,libmemcached))
$(eval $(call BuildPackage,memcachedutil))
