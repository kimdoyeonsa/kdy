#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=csv
PECL_LONGNAME:=csv

PKG_VERSION:=0.4.1
PKG_RELEASE:=1
PKG_HASH:=dfcf2049a0722a8f00481834378247df3f78613ca6db5fb4ab098a4ccb808a41

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=CSV-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/
PKG_BUILD_DEPENDS:=php8

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/CSV-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php8/pecl.mk



$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),libslang2-mod-csv,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
