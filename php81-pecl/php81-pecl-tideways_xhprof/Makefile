#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=tideways_xhprof
PECL_LONGNAME:=tideways_xhprof
PKG_VERSION:=5.0.4
PKG_RELEASE:=1
PKG_HASH:=a414e5d30cba360fbbc54ce929a6db4ae8a9b93a2e58d447e6a5dd7af6fecf72
PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/tideways/php-xhprof-extension/archive/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/php-xhprof-extension-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE
PKG_ASSET:=php81-pecl-xhprof-asset

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
--enable-tideways-xhprof

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME)))
$(eval $(call BuildPackage,$(PKG_NAME)))
