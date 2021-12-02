#
# Copyright (C) 2006-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=enchant
PKG_VERSION:=1.6.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.abisource.com/downloads/$(PKG_NAME)/$(PKG_VERSION)
PKG_HASH:=2fac9e7be7e9424b2c5570d8affe568db39f7572c10ed48d4e13cddf03f7097f
PKG_MAINTAINER:=Ted Hess <thess@kitschensync.net>

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1


include $(INCLUDE_DIR)/package.mk
define Package/enchant
 SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=enchant spellchecking 
  URL:=http://www.abisource.com/
  DEPENDS:=+libenchant
endef

define Package/libenchant
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=enchant spellchecking library 
  URL:=http://www.abisource.com/
  DEPENDS:=+libaspell +glib2 +dbus +libintl-full +libiconv-full +libhunspell
endef

define Package/enchant/description
	enchant spellchecking library 
endef
TARGET_CFLAGS += $(FPIC) -Wno-unused-value



define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/enchant $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.{so*,la,a} $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/enchant
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/enchant/*.{so*,la,a} $(1)/opt/lib/enchant/
endef
define Package/libenchant/install
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.{so*,la,a} $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/enchant
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/enchant/*.{so*,la,a} $(1)/opt/lib/enchant/
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/enchant.pc $(1)/opt/lib/pkgconfig/
endef
define Package/enchant/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin
endef

$(eval $(call BuildPackage,enchant))
$(eval $(call BuildPackage,libenchant))
