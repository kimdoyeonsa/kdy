#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=inotify
PECL_LONGNAME:=inotify

PKG_VERSION:=3.0.0
PKG_RELEASE:=1
PKG_HASH:=c71b78644c0115579cc794f58e78441441751d78040b9d9d1a223d3e9c2d723d

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=php81
PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

define Build/Prepare
	$(Build/Prepare/Default)
	( cp ./files/configure.patch $(PKG_BUILD_DIR); cd $(PKG_BUILD_DIR); $(STAGING_DIR)/opt/bin/phpize81 )
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); patch configure<configure.patch; ./configure $(CONFIGURE_ARGS) )
endef

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME)))
$(eval $(call BuildPackage,$(PKG_NAME)))
