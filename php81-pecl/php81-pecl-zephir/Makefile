#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=zephir
PECL_LONGNAME:=zephir

PKG_VERSION:=0.15.2
PKG_RELEASE:=1
PKG_HASH:=67967d8a6cf0fe580d409a58968936f7205b2ebd263b36a9930ddee40f186032

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/zephir-lang/zephir/archive/refs/tags/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

define Build/Prepare
	$(Build/Prepare/Default)
	( cd $(PKG_BUILD_DIR)/ext; $(STAGING_DIR)/opt/bin/phpize81 )
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR)/ext; ./configure $(CONFIGURE_ARGS) --enable-stub=yes )
endef

define Build/Compile
+$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR)/ext \
		DESTDIR="$(PKG_INSTALL_DIR)" all
	$(MAKE) -C $(PKG_BUILD_DIR)/ext \
		DESTDIR="$(PKG_INSTALL_DIR)" install 
	$(CP)  $(PKG_BUILD_DIR)/ext/modules $(PKG_BUILD_DIR)
	mv	$(PKG_BUILD_DIR)/modules/stub.so  $(PKG_BUILD_DIR)/modules/zephir.so
endef

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+PACKAGE_php81-mod-mysqli:php81-mod-mysqlnd,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
