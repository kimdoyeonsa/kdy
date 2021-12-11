#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=openswoole
PECL_LONGNAME:=openswoole

PKG_VERSION:=4.8.1
PKG_RELEASE:=1
PKG_HASH:=630f55d015f069b1dd83baa0b71e7ad376e0191c48645fd0ff47c8d48ee290c1

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

CONFIGURE_ARGS+= \
--enable-debug-log=no \
--enable-trace-log=no \
--enable-sockets=yes \
--enable-openssl=yes \
--enable-http2=yes \
--enable-swoole=yes \
--enable-mysqlnd=yes \
--with-postgres=$(STAGING_DIR)/opt/bin \
--enable-cares=no \
--with-openssl-dir=$(STAGING_DIR)/opt/include \
--with-jemalloc-dir=no \
--enable-asan=no \
--enable-swoole-coverage=yes \
--enable-swoole-dev=no \
--enable-swoole-json=yes \
--enable-swoole-curl=yes \
--enable-thread-context=yes

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libpq +libopenssl +libstdcpp,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
