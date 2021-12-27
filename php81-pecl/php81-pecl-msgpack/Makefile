#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=msgpack
PECL_LONGNAME:=msgpack

PKG_VERSION:=2.2.0RC1
PKG_RELEASE:=1
PKG_HASH:=55ad876ba2340233450fc246978229772078f16d83edbab0f6ccb2cc4b7ca63f

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/ext/msgpack
	$(CP)	$(PKG_BUILD_DIR)/php_msgpack.h $(1)/opt/include/ext/msgpack
endef

define Package/msgpack-h
 SUBMENU:=PHP81
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=msgpack-h
endef

define Package/msgpack-h/install
	$(INSTALL_DIR) $(1)/opt/include/ext/msgpack
	$(CP)	$(PKG_BUILD_DIR)/php_msgpack.h $(1)/opt/include/ext/msgpack
endef

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+php81-mod-session +php81-mod-sockets +msgpack-h,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
$(eval $(call BuildPackage,msgpack-h))
