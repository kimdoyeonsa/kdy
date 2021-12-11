#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=grpc
PECL_LONGNAME:=grpc

PKG_VERSION:=1.43.0RC1
PKG_RELEASE:=1
PKG_HASH:=b1417aade6894a7e40492a7f560a17ac91dd544150eafb9410dc58394aa1c9d3

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
	--enable-grpc

	
$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),libstdcpp,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
