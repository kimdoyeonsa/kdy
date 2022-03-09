#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=memcached
PECL_LONGNAME:=memcached

PKG_VERSION:=3.2.0RC1
PKG_RELEASE:=1
PKG_HASH:=11abf8db598fd8f7b8f94dfa5ec8bc518d5163c0dd1416617e168f8552c2edf5

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
PHP_MEMCACHED_IGBINARY=yes \
PHP_MEMCACHED_MSGPACK=yes

CONFIGURE_ARGS+= \
      --enable-memcached \
      --with-libmemcached-dir=$(STAGING_DIR)/opt \
      --enable-memcached-session=yes \
      --enable-memcached-igbinary=no \
      --enable-memcached-json=yes \
      --enable-memcached-msgpack=no \
      --enable-memcached-sasl=yes \
      --enable-memcached-protocol=yes \
      --with-system-fastlz=yes \
      --with-zlib-dir=$(STAGING_DIR)/opt

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+memcached +libmemcached +zlib +zlib-dev +libfastlz +igbinary-h +libsasl2,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
