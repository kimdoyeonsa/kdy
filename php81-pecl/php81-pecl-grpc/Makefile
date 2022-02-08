#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=grpc
PECL_LONGNAME:=grpc

PKG_VERSION:=1.43.0
PKG_RELEASE:=1
PKG_HASH:=f4b41a6398666221fa03f7e01d2591b4b0e32aaf1aeca52810e6ef0c4a16d055

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

define Package/grpc-h
 SUBMENU:=PHP81
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=grpc-h
endef

define Package/grpc-h/install
	$(INSTALL_DIR) $(1)/opt/include/grpc
	$(CP)	$(PKG_BUILD_DIR)/include/grpc/grpc.h $(1)/opt/include/grpc
endef

	
$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libstdcpp +grpc-h,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
$(eval $(call BuildPackage,grpc-h))
