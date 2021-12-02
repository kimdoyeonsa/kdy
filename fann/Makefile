#
# Copyright (C) 2010-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fann
PKG_VERSION:=a3cd24e528d6a865915a4fed6e8fac164ff8bfdc
PKG_RELEASE:=1
PKG_COMMIT:=a3cd24e528d6a865915a4fed6e8fac164ff8bfdc
PKG_SOURCE:=$(PKG_COMMIT).tar.gz
PKG_SOURCE_URL:=https://github.com/libfann/fann/archive
PKG_HASH:=751b38c5667f851719f8beaf5146df67cf20e026fd4be299274130e0c0965baa

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=COPYING


PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk



define Package/libfann
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=Fast Artificial Neural Network Library
	URL:=https://github.com/libfann/fann
	DEPENDS:=+libstdcpp
endef


define Package/fann/description
	Fast Artificial Neural Network (FANN) Library is a free open source neural network library, which implements multilayer artificial neural networks in C with support for both fully connected and sparsely connected networks
endef



define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/* $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.{so*,a} $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/*.pc $(1)/opt/lib/pkgconfig/
endef

define Package/libfann/install
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/* $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.{so*,a} $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/*.pc $(1)/opt/lib/pkgconfig/
endef

$(eval $(call BuildPackage,libfann))
