#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=vld
PECL_LONGNAME:=vld

PKG_VERSION:=0.17.2
PKG_RELEASE:=1
PKG_HASH:=57231a6de4e32111714f8749c65112d0fbc66bf13572fa33bf8b48c4b3c9e705

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
include $(INCLUDE_DIR)/nls.mk
include ../../php8/pecl.mk
CONFIGURE_VARS+= \
CPPFLAGS="-Wall"

CONFIGURE_ARGS+= \
--enable-vld \
--enable-vld-dev=AX_CHECK_COMPILE_FLAG

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME)))
$(eval $(call BuildPackage,$(PKG_NAME)))
