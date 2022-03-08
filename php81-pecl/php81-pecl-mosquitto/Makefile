#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=Mosquitto
PECL_LONGNAME:=Mosquitto

PKG_COMMIT=2c9ca344aacfd7861f27a0abe5d89a9cfcce5ba9
PKG_VERSION:=0.4.0
PKG_RELEASE:=1
PKG_HASH:=9ecdf383d27df27175e6f8afc76a02482affdcc1d8d0039a04c8b61919dea4b6

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PKG_COMMIT).tar.gz
PKG_SOURCE_URL:=https://github.com/mgdm/Mosquitto-PHP/archive/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/Mosquitto-PHP-$(PKG_COMMIT)
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
	( cd $(PKG_BUILD_DIR); ./configure $(CONFIGURE_ARGS) --with-mosquitto=$(STAGING_DIR)/opt )
endef

define Build/Compile
+$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" all
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" install 
	mv	$(PKG_BUILD_DIR)/modules/mosquitto.so  $(PKG_BUILD_DIR)/modules/Mosquitto.so
endef

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libmosquitto,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
