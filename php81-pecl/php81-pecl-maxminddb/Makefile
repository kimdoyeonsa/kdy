#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=maxminddb
PECL_LONGNAME:=maxminddb
PKG_VERSION:=1.11.0
PKG_RELEASE:=1
PKG_HASH:=a57927e47341ee1d981ce11c09cd2d581366a18971e7c8b6b4aba86db6cf1c74
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
	( cd $(PKG_BUILD_DIR)/ext; $(STAGING_DIR)/opt/bin/phpize81 )
endef


define Build/Configure
	( cd $(PKG_BUILD_DIR)/ext; ./configure $(CONFIGURE_ARGS) --with-maxminddb=$(STAGING_DIR)/opt --enable-maxminddb-debug )
endef

define Build/Compile
+$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR)/ext \
		DESTDIR="$(PKG_INSTALL_DIR)" all
	$(MAKE) -C $(PKG_BUILD_DIR)/ext \
		DESTDIR="$(PKG_INSTALL_DIR)" install 
	$(CP)  $(PKG_BUILD_DIR)/ext/modules $(PKG_BUILD_DIR)
endef

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libmaxminddb,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
