#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=sdl
PECL_LONGNAME:=sdl

PKG_VERSION:=2.6.0
PKG_RELEASE:=1
PKG_HASH:=fff5913d4f7b0404b87fd962a593535e7e28892312b2431176c9677f5a777a98

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
      --with-sdl=$(STAGING_DIR)/opt/bin

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+sdl2-config +libsdl2,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
