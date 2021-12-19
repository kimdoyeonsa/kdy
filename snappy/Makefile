#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=snappy
PKG_VERSION:=1.1.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/google/snappy/archive/refs/tags/
PKG_HASH:=75c1fbb3d618dd3a0483bff0e26d0a92b495bbe5059c8b4f1c962b478b6e06e7

PKG_MAINTAINER:=
PKG_LICENSE:=BSD-2-Clause
PKG_LICENSE_FILES:=LICENSE

CMAKE_INSTALL:=1
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk


define Package/libsnappy/description
Snappy, a fast compressor/decompressor.
endef
	

define Package/libsnappy
  TITLE:=snappy library
    SECTION:=libs
  CATEGORY:=Libraries
   DEPENDS:=+libstdcpp
endef



CMAKE_OPTIONS = \
		-DCMAKE_SYSTEM_NAME=Linux \
		-DCMAKE_HOST_SYSTEM_NAME=Linux \
		-DCMAKE_INSTALL_PREFIX=/opt \
		-DCMAKE_CXX_FLAGS=$(CXXFLAGS) \
		-DCMAKE_C_FLAGS=$(CFLAGS) \
		-DBUILD_SHARED_LIBS=ON \
		-DBUILD_STATIC_LIBS=ON \
		-DSNAPPY_BUILD_BENCHMARKS=OFF \
		-DSNAPPY_BUILD_TESTS=OFF \
		-DSNAPPY_INSTALL=ON  \
		-DCMAKE_GENERATOR="Ninja" \
			$(CMAKE_CROSSOPTS) 
CMAKE_SOURCE_DIR=

		 
define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/
	$(CP) $(PKG_INSTALL_DIR)/opt/include/*.h $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libsnappy.{a,so*} $(1)/opt/lib/
endef

define Package/libsnappy/install
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libsnappy.{a,so*} $(1)/opt/lib/
endef

$(eval $(call BuildPackage,libsnappy))


