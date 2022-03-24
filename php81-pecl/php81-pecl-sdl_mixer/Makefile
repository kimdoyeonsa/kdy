#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=sdl_mixer
PECL_LONGNAME:=sdl_mixer

PKG_VERSION:=0.4.0
PKG_RELEASE:=1
PKG_HASH:=511f1bef35dc6946368cd5c764d90bd5c7cb196edb7312cb9435c8ec25c355c4

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
SDL_MIXER_DIR=$(STAGING_DIR)/opt

CONFIGURE_ARGS+= \
      --enable-sdl_mixer

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libsdl2 +libsdl2_mixer,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
