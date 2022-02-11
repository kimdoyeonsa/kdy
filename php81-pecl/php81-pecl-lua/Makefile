#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=lua
PECL_LONGNAME:=lua

PKG_VERSION:=2.0.7
PKG_RELEASE:=1
PKG_HASH:=86545e1e09b79e3693dd93f2a5a8f15ea161b5a1928f315c7a27107744ee8772

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

CONFIGURE_VARS+= \
PHP_LUA_VERSION=5.4

CONFIGURE_ARGS+= \
--with-lua=$(STAGING_DIR)/opt \
--with-lua-version=5.4

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+liblua5.4 +lua5.4,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
