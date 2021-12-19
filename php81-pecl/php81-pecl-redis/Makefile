#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=redis
PECL_LONGNAME:=PHP extension for interfacing with Redis

PKG_VERSION:=5.3.5
PKG_RELEASE:=1
PKG_HASH:=d55fa5cc699198917ba2bdc827da632ad77f009ba2642d2750456a976dbe5989

PKG_NAME:=php81-pecl-redis
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=COPYING

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
	--enable-redis \
	--enable-redis-json \
	--disable-redis-igbinary \
	--disable-redis-lzf \
	--disable-redis-msgpack

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME), +php81-mod-session,25))
$(eval $(call BuildPackage,$(PKG_NAME)))
