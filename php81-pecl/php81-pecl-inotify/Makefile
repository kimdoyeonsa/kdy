#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=inotify
PECL_LONGNAME:=inotify


PKG_VERSION:=3.0.0
PKG_RELEASE:=1
PKG_COMMIT:=d032bdb056926e6378780e440587f94c50e47dc6
PKG_HASH:=514e43f5fdc9976c4a9999e8caab3ad79731799ee7bf905170fa2a368a88742e

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PKG_COMMIT).tar.gz
PKG_SOURCE_URL:=https://github.com/arnaud-lb/php-inotify/archive/

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=php81
PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/php-$(PECL_NAME)-$(PKG_COMMIT)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
--target=$(GNU_TARGET_NAME) \
--host=$(GNU_TARGET_NAME) \
--build=$(GNU_HOST_NAME) \
--enable-inotify \
--disable-option-checking
CONFIGURE_VARS+= \
cross_compiling=no


$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME)))
$(eval $(call BuildPackage,$(PKG_NAME)))
