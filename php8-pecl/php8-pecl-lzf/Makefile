#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=lzf
PECL_LONGNAME:=lzf

PKG_VERSION:=1.6.8
PKG_RELEASE:=1
PKG_HASH:=8e1c2ed211439a78f6efb80116a1fb0bf24aec2f659e90669b8f03ed8142f589

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=LZF-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/
PKG_BUILD_DEPENDS:=php8

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/LZF-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php8/pecl.mk

CONFIGURE_ARGS+= \
	--enable-lzf \
	--enable-lzf-better-compression \
	--with-liblzf=$(STAGING_DIR)/opt


$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),liblzf,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
