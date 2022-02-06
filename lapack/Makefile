#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Entware specific: 002-no-utility.patch removed, flac and utilities added
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lapack
PKG_VERSION:=3.10.0
PKG_RELEASE:=1

PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Reference-LAPACK/lapack/archive/refs/tags/
PKG_HASH:=328c1bea493a32cac5257d84157dc686cc3ab0b004e2bea22044e0a59f6f8a19

PKG_MAINTAINER:=Ted Hess <thess@kitschensync.net>
PKG_LICENSE:=GFDL-1.2 GPL-2 LGPL-2.1
PKG_LICENSE_FILES:=README
PKG_CPE_ID:=cpe:/a:lapack:lapack

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

# include $(INCLUDE_DIR)/cmake.mk
GCC=$(REAL_GNU_TARGET_NAME)-gcc
GFC=$(REAL_GNU_TARGET_NAME)-gfortran
GAR=$(REAL_GNU_TARGET_NAME)-ar
GRL=$(REAL_GNU_TARGET_NAME)-gcc-ranlib

CONFIGURE_ARGS += \
--enable-shared \
--disable-static
	  
define Package/LAPACK
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=lapack
  URL:=http://netlib.org/lapack/lapack-3.10.0.html
   DEPENDS:= +libgfortran
endef

MAKE_FLAGS += \
	CC=$(GCC) \
	FC=$(GFC) \
	AR=$(GAR) \
	RANLIB=$(GRL)
	
define Build/Configure
( mv $(PKG_BUILD_DIR)/make.inc.example $(PKG_BUILD_DIR)/make.inc; )
$(Build/Configure/Default)
endef

define Build/Compile
$(MAKE) -j4 $(MAKE_FLAGS) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" all
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_BUILD_DIR)/LAPACKE/include/*.h $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_BUILD_DIR)/lib*.a $(1)/opt/lib/
endef

define Package/LAPACK/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_BUILD_DIR)/lib*.a $(1)/opt/lib/	
endef

$(eval $(call BuildPackage,LAPACK))
