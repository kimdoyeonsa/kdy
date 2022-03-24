#
# Copyright (C) 2010-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=SDL2_mixer
PKG_VERSION:=2.0.4
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://www.libsdl.org/projects/SDL_mixer/release/
PKG_HASH:=b4cf5a382c061cd75081cf246c2aa2f9df8db04bdda8dcdc6b6cca55bede2419

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=COPYING

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libsdl2_mixer
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libsdl2_mixer
  URL:=https://www.libsdl.org/projects/SDL_mixer
  DEPENDS:=+libsdl2
endef

CONFIGURE_ARGS+= \
--with-gnu-ld=yes \
--enable-music-mp3-mad-gpl=yes \
--enable-music-mod-mikmod=yes \
--disable-sdltest \
--disable-libtool-lock

define Package/libsdl2_mixer/description
	SDL_mixer is a sample multi-channel audio mixer library.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/
	$(CP) $(PKG_INSTALL_DIR)/opt/include/SDL2 $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libSDL2_mixer*.{so*,la,a} $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/SDL2_mixer.pc /$(1)/opt/lib/pkgconfig
endef

define Package/libsdl2_mixer/install
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libSDL2_mixer*.so* $(1)/opt/lib/
endef

$(eval $(call BuildPackage,libsdl2_mixer))
