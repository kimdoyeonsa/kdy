#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=openal
PECL_LONGNAME:=openal

PKG_COMMIT:=6f78e95120ffe2cd30813a78ca66eaedde310314
PKG_VERSION:=0.10.0
PKG_RELEASE:=1
PKG_HASH:=0931c8856464ea446431d692206496ebc184231f357a1cc5ca53e9ebcfa7a40e

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PKG_COMMIT).tar.gz
PKG_SOURCE_URL:=https://github.com/Ponup/php-openal/archive

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/php-$(PECL_NAME)-$(PKG_COMMIT)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
--with-openal=$(STAGING_DIR)/opt
	
$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+openal +libopenal,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
