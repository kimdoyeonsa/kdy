#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=grpc
PECL_LONGNAME:=grpc

PKG_VERSION:=1.44.0
PKG_RELEASE:=1
PKG_HASH:=f6d6be7e1bd49b3aae7ada97233fe68172100a71a23e5039acb2c0c1b87e4f11

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
	
define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/grpc
	$(CP)	$(PKG_BUILD_DIR)/include/grpc/grpc.h $(1)/opt/include/grpc
endef
	
$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libstdcpp,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
