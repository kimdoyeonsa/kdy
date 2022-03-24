#
# Copyright (C) 2010-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=SDL2_image
PKG_VERSION:=2.0.5
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://www.libsdl.org/projects/SDL_image/release/
PKG_HASH:=bdd5f6e026682f7d7e1be0b6051b209da2f402a2dd8bd1c4bd9c25ad263108d0

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=COPYING

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libsdl2_image
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libsdl2_image
  URL:=https://www.libsdl.org/projects/SDL_mixer
  DEPENDS:=+libsdl2
endef

CONFIGURE_ARGS+= \
--disable-libtool-lock \
--disable-sdltest \
--with-gnu-ld=yes
 
define Package/libsdl2_image/description
	SDL_mixer is a sample multi-channel audio mixer library.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/
	$(CP) $(PKG_INSTALL_DIR)/opt/include/SDL2 $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libSDL2_image*.{so*,la,a} $(1)/opt/lib
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/SDL2_image.pc /$(1)/opt/lib/pkgconfig
endef

define Package/libsdl2_image/install
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libSDL2_image*.so* $(1)/opt/lib
endef

$(eval $(call BuildPackage,libsdl2_image))
