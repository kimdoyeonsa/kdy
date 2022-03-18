#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=swoole
PECL_LONGNAME:=swoole

PKG_VERSION:=4.8.8
PKG_RELEASE:=1
PKG_HASH:=4a7843442eff6bb0531e7f3b73a602cff47c8c8e9a112d626d20fa60097a47e2

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
--enable-debug=yes \
--enable-sockets=yes \
--enable-openssl=yes \
--enable-http2=yes \
--enable-swoole=yes \
--enable-mysqlnd=yes \
--enable-cares=yes \
--with-openssl-dir=$(STAGING_DIR)/opt/include \
--with-jemalloc-dir=yes \
--enable-asan=no \
--enable-swoole-coverage=yes \
--enable-swoole-curl=yes \
--enable-swoole-dev=no \
--enable-swoole-json=yes \
--enable-swoole-curl=yes \
--enable-thread-context=yes \
--enable-swoole-pgsql=yes \
--enable-swoole-coro-time=yes

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libstdcpp +libopenssl +libasan +libcares +libatomic +libjemalloc,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
