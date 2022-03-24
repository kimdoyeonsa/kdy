#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=sdl_image
PECL_LONGNAME:=sdl_image

PKG_VERSION:=0.4.0
PKG_RELEASE:=1
PKG_HASH:=cde9df0c449d0143f19c3ddf61b2244cfe728d67a21f0a84828b44c183170e66

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
SDL_IMAGE_DIR=$(STAGING_DIR)/opt

CONFIGURE_ARGS+= \
      --enable-sdl_image

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libsdl2 +libsdl2_image,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
