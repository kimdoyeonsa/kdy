#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=xhprof
PECL_LONGNAME:=xhprof
PKG_VERSION:=2.3.5
PKG_RELEASE:=1
PKG_HASH:=f3b93619e038abe2bbed5f2898cd9c024d6ea1d34eace217ccafc0de7ad50e23
PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE
PKG_ASSET:=php81-pecl-xhprof-asset

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk
define Package/$(PKG_NAME)-asset
 SUBMENU:=PHP81
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=xhprof-asset
endef

define Build/Prepare
	$(Build/Prepare/Default)
	( cd $(PKG_BUILD_DIR)/extension; $(STAGING_DIR)/opt/bin/phpize81 )
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR)/extension; ./configure $(CONFIGURE_ARGS) --enable-xhprof )
endef

define Build/Compile
+$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR)/extension \
		DESTDIR="$(PKG_INSTALL_DIR)" all
	$(MAKE) -C $(PKG_BUILD_DIR)/extension \
		DESTDIR="$(PKG_INSTALL_DIR)" install 

	$(CP)  $(PKG_BUILD_DIR)/extension/modules $(PKG_BUILD_DIR)
	

endef

define Package/php81-pecl-xhprof-asset/install
	$(INSTALL_DIR) $(1)/opt/etc/$(PECL_NAME)/assets
	$(CP)  $(PKG_BUILD_DIR)/$(PECL_NAME)_lib $(1)/opt/etc/$(PECL_NAME)/assets
	$(CP)  $(PKG_BUILD_DIR)/$(PECL_NAME)_html $(1)/opt/etc/$(PECL_NAME)/assets
	$(CP)  $(PKG_BUILD_DIR)/examples $(1)/opt/etc/$(PECL_NAME)/assets

endef

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libpcre2 +php81-pecl-xhprof-asset,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
$(eval $(call BuildPackage,$(PKG_ASSET)))
