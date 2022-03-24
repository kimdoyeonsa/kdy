#
# Copyright (C) 2010-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=SDL2
PKG_VERSION:=2.0.20
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://www.libsdl.org/release/
PKG_HASH:=c56aba1d7b5b0e7e999e4a7698c70b63a3394ff9704b5f6e1c57e0c16f04dd06

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=COPYING
PKG_CPE_ID:=cpe:/a:gnu:sdl2

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/sdl2/default
  URL:=https://www.libsdl.org/index.php
  DEPENDS:=+alsa-lib +libiconv-full
endef

define Package/libsdl2
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libsdl2
  $(call Package/sdl2/default)
endef

define Package/sdl2-config
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=sdl2-config
endef

CONFIGURE_ARGS+= \
--disable-libtool-lock \
--enable-arm-simd=yes \
--enable-arm-neon=yes \
--enable-fusionsound=yes \
--enable-foregrounding-signal=no \
--enable-backgrounding-signal=no \
--enable-video-offscreen=yes \
--enable-video-directfb=yes

define Package/sdl2/description
	Simple DirectMedia Layer is a cross-platform development library designed to provide low level access to audio, keyboard, mouse, joystick, and graphics hardware via OpenGL and Direct3D. 
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/
	$(CP) $(PKG_INSTALL_DIR)/opt/include/SDL2 $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libSDL2*.{so*,la,a} $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/sdl2.pc $(1)/opt/lib/pkgconfig/
endef

define Package/libsdl2/install
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libSDL2*.so* $(1)/opt/lib/
endef

define Package/sdl2-config/install
	$(INSTALL_DIR) $(1)/opt/bin/
	$(CP) $(PKG_INSTALL_DIR)/opt/bin/sdl2-config $(1)/opt/bin/
endef

$(eval $(call BuildPackage,sdl2-config))
$(eval $(call BuildPackage,libsdl2))
