#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=vips
PECL_LONGNAME:=vips

PKG_VERSION:=1.0.12
PKG_RELEASE:=1
PKG_HASH:=c638250de6cad89d8648bff972af5224316ccb5b5b0a7c9201607709d5385282

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/
PKG_BUILD_DEPENDS:=php81

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS += \
--with-vips=yes



$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+vips +glib2,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
