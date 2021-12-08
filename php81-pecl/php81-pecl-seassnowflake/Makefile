#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=SeasSnowflake
PECL_LONGNAME:=seassnowflake

PKG_VERSION:=1.0.0
PKG_RELEASE:=1
PKG_HASH:=a7c9eea7f2065bd8576ddd8f27041d01a9e5f74cafb3de0de677cc0000cdbe61

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=SeasSnowflake-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/SeasSnowflake-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
	--enable-SeasSnowflake

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libstdcpp,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
