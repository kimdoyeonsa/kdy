#
# Copyright (C) 2006-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=enchant
PKG_VERSION:=2.3.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/AbiWord/enchant/releases/download/v$(PKG_VERSION)
PKG_HASH:=ce9ba47fd4d34031bd69445598a698a6611602b2b0e91d705e91a6f5099ead6e

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1


include $(INCLUDE_DIR)/package.mk
define Package/enchant2
 SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=enchant spellchecking 
  URL:=http://www.abisource.com/
  DEPENDS:=+libenchant2
endef

define Package/libenchant2
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=enchant spellchecking library 
  URL:=http://www.abisource.com/
  DEPENDS:=+libaspell +glib2 +dbus +libintl-full +libiconv-full +libnuspell +libhunspell
endef

define Package/enchant2/description
	enchant spellchecking library 
endef
TARGET_CFLAGS += $(FPIC) -Wno-unused-value


define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/enchant-2 $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.{so*,la,a} $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/enchant-2
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/enchant-2/*.{so*,la,a} $(1)/opt/lib/enchant-2/
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/enchant-2.pc $(1)/opt/lib/pkgconfig/
endef
define Package/libenchant2/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.{so*,la,a} $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/enchant-2
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/enchant-2/*.{so*,la,a} $(1)/opt/lib/enchant-2/
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/enchant-2.pc $(1)/opt/lib/pkgconfig/
endef
define Package/enchant2/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin
endef

$(eval $(call BuildPackage,enchant2))
$(eval $(call BuildPackage,libenchant2))
