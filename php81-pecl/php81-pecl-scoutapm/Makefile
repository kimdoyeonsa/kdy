#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=scoutapm
PECL_LONGNAME:=scoutapm
PKG_VERSION:=1.4.3
PKG_RELEASE:=1
PKG_HASH:=a77008fef075090e04d7aa73b6a7601b8f40c3cbe5950f15e6ffb5df86013c73

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
	--enable-scoutapm

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libcurl,,zend))
$(eval $(call BuildPackage,$(PKG_NAME)))
