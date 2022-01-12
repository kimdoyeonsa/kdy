#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=zip
PECL_LONGNAME:=zip

PKG_VERSION:=1.20.0

PKG_HASH:=1fe2668533521b15bb637a0803a8ac525a5ff4839f268fa6c0cd02faf0742b53

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
 --enable-zip \
 --with-libzip=$(STAGING_DIR)/opt
 
$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libzip,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
