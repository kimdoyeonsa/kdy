#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=fann
PECL_LONGNAME:=fann
PKG_VERSION:=1.2.0
PKG_COMMiT:=ac8d49c3999f4391c2c4510bfc208e66ed2d78d5
PKG_RELEASE:=1
PKG_HASH:=67e16b0e10b17f26adbecb49f43f2f1cc7fdf68b5c5b49976858179c3131126d

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PKG_COMMiT).tar.gz
PKG_SOURCE_URL:=https://github.com/bukka/php-fann/archive

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/php-$(PECL_NAME)-$(PKG_COMMiT)
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
	( cd $(PKG_BUILD_DIR); ./configure $(CONFIGURE_ARGS) --with-fann=$(STAGING_DIR)/opt  )
endef

define Build/Compile
+$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" all
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" install 
endef


$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libfann,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
