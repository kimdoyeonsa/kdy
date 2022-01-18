#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cairo
PKG_VERSION:=1.16.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://www.cairographics.org/releases
PKG_HASH:=5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331

PKG_LICENSE:=LGPL-2.1
PKG_LICENSE_FILES:=LICENSE
PKG_CPE_ID:=cpe:/a:cairo:cairo
PKG_FIXUP:=libtool
include $(INCLUDE_DIR)/package.mk

define Package/libcairo
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libcairo
  URL:=https://www.cairographics.org/
  DEPENDS:=+zlib +libpng +pixman +libintl-full +glib2 +liblzo +libfreetype
endef

define Package/cairo
   SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=cairo
  URL:=https://www.cairographics.org/
  DEPENDS:=+libcairo
endef

define Package/cairo/description
	Cairo is a 2D graphics library with support for multiple output devices. Currently supported output targets include the X Window System (via both Xlib and XCB), Quartz, Win32, image buffers, PostScript, PDF, and SVG file output. Experimental backends include OpenGL, BeOS, OS/2, and DirectFB.
endef

CONFIGURE_ARGS += \
		--prefix=/opt \
		--enable-ft \
		--enable-gobject \
		--enable-pdf \
		--enable-png \
		--enable-ps \
		--enable-svg \
		--enable-tee \
		--enable-x \
		--disable-xcb \
		--disable-xcb-shm \
		--disable-xlib \
		--disable-xlib-xrender \
		--disable-xlib-xcb
define Build/Compile
+$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" all install		
endef
		
define Build/InstallDev
	$(INSTALL_DIR)						$(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/cairo/*.h		$(1)/opt/include
	$(INSTALL_DIR)			$(1)/opt/lib/		$(1)/opt/lib/cairo
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libcairo*.{a,la,so*}	$(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/cairo/*.{a,la,so}	$(1)/opt/lib/cairo
	$(INSTALL_DIR)						$(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/*.pc	$(1)/opt/lib/pkgconfig
endef		

define Package/cairo/install
	$(INSTALL_DIR)				$(1)/opt/bin
	$(INSTALL_BIN) 	$(PKG_INSTALL_DIR)/opt/bin/*	$(1)/opt/bin
endef

define Package/libcairo/install
	$(INSTALL_DIR)				$(1)/opt/lib		$(1)/opt/lib/cairo
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libcairo*.so*	$(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/cairo/*.so	$(1)/opt/lib/cairo
endef

$(eval $(call BuildPackage,cairo))
$(eval $(call BuildPackage,libcairo))
