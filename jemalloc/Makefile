#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=jemalloc
PKG_VERSION:=5.2.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://github.com/jemalloc/jemalloc/releases/download/$(PKG_VERSION)/
PKG_HASH:=34330e5ce276099e2e8950d9335db5a875689a4c6a56751ef3b1d8c537f887f6
PKG_LICENSE:=BSD-2-Clause

PKG_BUILD_PARALLEL:=1
PKG_FIXUP:=autoreconf
PKG_INSTALL:=1
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk

define Package/libjemalloc
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libjemalloc
  DEPENDS:=+libstdcpp
endef

define Package/jemalloc
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=jemalloc
  URL:=jemalloc.net/
endef

define Package/jemalloc/description
	jemalloc is a general purpose malloc(3) implementation that emphasizes
fragmentation avoidance and scalable concurrency support.
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
  --enable-shared \
  --enable-static \
  --enable-xmalloc \
  --disable-libdl \
  --disable-syscall \
  --disable-zone-allocator \
  --disable-initial-exec-tls 
  
define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/jemalloc/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/opt/include/jemalloc/*.h $(1)/opt/include/jemalloc/
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libjemalloc*.{a,so*} $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/* $(1)/opt/lib/pkgconfig/
endef

define Package/libjemalloc/install
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libjemalloc*.{a,so*} $(1)/opt/lib/
endef

define Package/jemalloc/install
	$(INSTALL_DIR) $(1)/opt/bin/
	$(CP) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin/
endef
$(eval $(call BuildPackage,jemalloc))
$(eval $(call BuildPackage,libjemalloc))
