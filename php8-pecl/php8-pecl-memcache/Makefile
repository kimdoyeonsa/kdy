#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=memcache
PECL_LONGNAME:=memcache

PKG_VERSION:=8.0
PKG_RELEASE:=1
PKG_HASH:=defe33e6f7831d82b7283b95e14a531070531acbf21278f3f0d7050505cf3395

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php8/pecl.mk

CONFIGURE_ARGS+= \
	--enable-memcache \
      --enable-memcache-session \
      --with-zlib-dir=$(STAGING_DIR)/opt

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+memcached +zlib +zlib-dev,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
