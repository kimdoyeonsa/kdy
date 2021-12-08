#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=var_representation
PECL_LONGNAME:=var_representation
PKG_VERSION:=0.1.1
PKG_RELEASE:=1
PKG_HASH:=68d5511651e2e2ed320b9fcac56ffba94237ada6bd3007de09287776167e347f
PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1


PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php8/pecl.mk


define Build/Prepare
	$(Build/Prepare/Default)
	( cd $(PKG_BUILD_DIR); $(STAGING_DIR)/opt/bin/phpize8 )
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./configure $(CONFIGURE_ARGS) --enable-var_representation )
endef

define Build/Compile
+$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" all
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" install 
	
endef

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
