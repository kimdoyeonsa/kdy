# This Makefile is free software, SPDX codes: GPL-2.0-or-later OR MIT

include $(TOPDIR)/rules.mk

PKG_NAME:=dlib
PKG_VERSION:=19.23
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://dlib.net/files/
PKG_HASH:=b1be30672302abdb8e010a21edf50d20a398ef9c38fddc45334dedf058af288a

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_CPE_ID:=cpe:/a:dlib_project:dlib

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/dlib
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=dlib library 
  URL:=http://dlib.net/
  DEPENDS:=+libpng +libjpeg-turbo +giflib +openblas +libsqlite3 +libstdcpp
endef

define Package/dlib/description
 Dlib is a modern C++ toolkit containing machine learning algorithms and tools for creating complex software in C++ to solve real world problems.
endef

CMAKE_SOURCE_DIR=dlib
CMAKE_OPTIONS += \
-DCMAKE_INSTALL_PREFIX=/opt \
-DCMAKE_INSTALL_LIBDIR=/opt/lib \
-DBUILD_SHARED_LIBS=ON \
-DCMAKE_BUILD_TYPE=None 

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/
	$(CP) $(PKG_INSTALL_DIR)/opt/include/dlib $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/include/dlib
	$(CP) $(PKG_BUILD_DIR)/dlib/* $(1)/opt/include/dlib
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libdlib.so* $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/dlib-1.pc $(1)/opt/lib/pkgconfig
endef

define Package/dlib/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libdlib.so* $(1)/opt/lib/
endef

$(eval $(call BuildPackage,dlib))
