#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=teds
PECL_LONGNAME:=teds
PKG_VERSION:=0.5.1
PKG_RELEASE:=1
PKG_HASH:=8c6acbb3ef221467c2693452c139367795582b2d38ca5aa236c1ee9b7fcd1ee4
PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk


define Build/Prepare
	$(Build/Prepare/Default)
	( cd $(PKG_BUILD_DIR); $(STAGING_DIR)/opt/bin/phpize81 )
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./configure $(CONFIGURE_ARGS) --enable-teds )
endef

define Build/Compile
+$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" all
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" install 
	
endef

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME)))
$(eval $(call BuildPackage,$(PKG_NAME)))
