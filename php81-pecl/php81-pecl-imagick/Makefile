#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=imagick
PECL_LONGNAME:=Image Processing (ImageMagick binding)

PKG_VERSION:=3.6.0
PKG_RELEASE:=1
PKG_HASH:=4e2965f2d70dd59a40e7957d56e590e731cad2669e9f89e0fca159d748d2947e

PKG_NAME:=php81-pecl-imagick
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=php81
PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= --with-imagick="$(STAGING_DIR)/opt"

$(eval $(call PHP81PECLPackage,imagick,$(PECL_LONGNAME),+imagemagick,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
