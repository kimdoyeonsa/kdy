#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=sodium
PECL_LONGNAME:=Bindings for libsodium
PKG_VERSION:=2.0.23
PKG_RELEASE:=$(AUTORELEASE)
PKG_HASH:=f8c04533de8e4b48077f65de61b187e195c0919c41d4543e2263604fa0c50379

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=lib$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/lib$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=ISC
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
--with-sodium=$(STAGING_DIR)/opt

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libsodium,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
