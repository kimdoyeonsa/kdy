#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=timezonedb
PECL_LONGNAME:=timezonedb

PKG_VERSION:=2021.5
PKG_RELEASE:=1
PKG_HASH:=30c85bd45da91e91f07a33711fc4f6b29aa220b9df356ecd43540be1e7a53cc2

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
	--enable-timezonedb

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME)))
$(eval $(call BuildPackage,$(PKG_NAME)))
