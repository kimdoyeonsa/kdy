
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pango
PKG_VERSION:=1.50.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@GNOME/pango/1.50
PKG_HASH:=4add05edf51c1fb375a1ccde7498914120e23cb280dd7395b1aeb441f1838a4c

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/pango
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=library for layout and rendering of text
  URL:=https://www.pango.org/
  DEPENDS:=+libpango
endef

define Package/libpango
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=library for layout and rendering of text
  URL:=https://www.pango.org/
  DEPENDS:=+glib2 +libcairo +libfreetype +fontconfig +icu-full-data
endef

define Package/pango/description
 Pango is a library for laying out and rendering of text, with an emphasis on internationalization.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/harfbuzz/*.h
	$(CP) $(PKG_INSTALL_DIR)/opt/include/harfbuzz/*.h $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/include/fribidi/*.h
	$(CP) $(PKG_INSTALL_DIR)/opt/include/fribidi/*.h $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/include/pango
	$(CP) $(PKG_INSTALL_DIR)/opt/include/pango-1.0/pango/*.h $(1)/opt/include/pango
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.so.* $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/*.pc $(1)/opt/lib/pkgconfig/
endef

define Package/pango/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(CP) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin/
endef

define Package/libpango/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.so.* $(1)/opt/lib/
endef

$(eval $(call BuildPackage,pango))
$(eval $(call BuildPackage,libpango))
