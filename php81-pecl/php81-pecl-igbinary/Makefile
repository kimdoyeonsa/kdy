#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=igbinary
PECL_LONGNAME:=igbinary
PKG_VERSION:=3.2.7
PKG_RELEASE:=1
PKG_HASH:=d0dc0d0b56a985f4f52cea20717133d3da05368876bc0f94317c1e60e0319e7d

PKG_NAME:=php81-pecl-igbinary
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=php81
PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
--with-igbinary \
--enable-igbinary

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/ext/igbinary
	$(CP)	$(PKG_BUILD_DIR)/igbinary.h $(1)/opt/include/ext/igbinary
	$(INSTALL_DIR) $(1)/opt/include/src/php7
	$(CP)	$(PKG_BUILD_DIR)/src/php7/igbinary.h $(1)/opt/include/src/php7
endef

define Package/igbinary-h
 SUBMENU:=PHP81
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=igbinary-h
endef

define Package/igbinary-h/install
	$(INSTALL_DIR) $(1)/opt/include/ext/igbinary
	$(CP)	$(PKG_BUILD_DIR)/igbinary.h $(1)/opt/include/ext/igbinary
	$(INSTALL_DIR) $(1)/opt/include/src/php7
	$(CP)	$(PKG_BUILD_DIR)/src/php7/igbinary.h $(1)/opt/include/src/php7
endef


$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+igbinary-h))
$(eval $(call BuildPackage,$(PKG_NAME)))
$(eval $(call BuildPackage,igbinary-h))
