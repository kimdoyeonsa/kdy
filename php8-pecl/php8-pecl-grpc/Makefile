#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=grpc
PECL_LONGNAME:=grpc

PKG_VERSION:=1.42.0RC1
PKG_RELEASE:=1
PKG_HASH:=ae9f5f5fcd32424a34afd0c498ff90c62f0bde242160a9a5670fcba414e108ef

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php8/pecl.mk

CONFIGURE_ARGS+= \
	--enable-grpc

	
$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),libstdcpp,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
