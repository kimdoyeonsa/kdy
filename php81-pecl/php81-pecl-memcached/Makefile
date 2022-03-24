#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=memcached
PECL_LONGNAME:=memcached

PKG_VERSION:=3.2.0
PKG_RELEASE:=1
PKG_HASH:=2a41143a7b29f4a962a3805b77aa207a99e4566e2d314ce98a051cd24d6e9636

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
phpincludedir=$(STAGING_DIR)/opt

CONFIGURE_ARGS+= \
      --enable-memcached \
      --with-libmemcached-dir=$(STAGING_DIR)/opt \
      --enable-memcached-session=yes \
      --enable-memcached-igbinary=yes \
      --enable-memcached-json=yes \
      --enable-memcached-msgpack=yes \
      --enable-memcached-sasl=yes \
      --enable-memcached-protocol=yes \
      --with-system-fastlz=yes \
      --with-zlib-dir=$(STAGING_DIR)/opt

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+memcached +libmemcached +zlib +zlib-dev +libfastlz +libsasl2 +php81-pecl-igbinary +php81-pecl-msgpack,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
