#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=stomp
PECL_LONGNAME:=stomp
PKG_VERSION:=2.0.3
PKG_COMMIT:=380e82bba1567bac80264b212bbb9df040b48a56
PKG_RELEASE:=1
PKG_HASH:=be0b4c6e37b9580847ff90c54d5c243892700b323a8c9f7b44c5c2d1f787ac16

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PKG_COMMIT).tar.gz
PKG_SOURCE_URL:=https://github.com/php/pecl-tools-stomp/archive

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/pecl-tools-$(PECL_NAME)-$(PKG_COMMIT)
PKG_BUILD_PARALLEL:=1
HOST_BUILD_PARALLEL:=1

PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

include $(INCLUDE_DIR)/nls.mk
include ../../php8/pecl.mk

CONFIGURE_ARGS+= \
--enable-stomp
--with-openssl-dir=$(STAGING_DIR)/opt



$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libopenssl,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
