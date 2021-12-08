#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=ds
PECL_LONGNAME:=ds
PKG_COMMIT=85921a13f799394cf2b89aa0817265b9d0c0ae23
PKG_VERSION:=1.3.0
PKG_RELEASE:=1
PKG_HASH:=b12a73e8cd73b0ef0c4d1e8b32e36f36a63e58e1772936642b1bebdc68a61f58

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PKG_COMMIT).tar.gz
PKG_SOURCE_URL:=https://github.com/php-ds/ext-ds/archive

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/ext-$(PECL_NAME)-$(PKG_COMMIT)
PKG_BUILD_PARALLEL:=1

PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php8/pecl.mk

CONFIGURE_ARGS+= \
--enable-ds

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME)))
$(eval $(call BuildPackage,$(PKG_NAME)))
