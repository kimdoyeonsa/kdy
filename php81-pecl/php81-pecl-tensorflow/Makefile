#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=tensorflow
PECL_LONGNAME:=tensorflow
PKG_COMMIT:=5d77904b1f42cd892addd8aba9e2e8968855735d

PKG_VERSION:=0.12.0
PKG_RELEASE:=1
PKG_HASH:=c32d562c20dabe42a2c93034e11928edc349e7e4ab995d33bc52a85771f4b0df

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PKG_COMMIT).tar.gz
PKG_SOURCE_URL:=https://github.com/wan2land/php-tensorflow/archive/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/php-$(PECL_NAME)-$(PKG_COMMIT)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

TENSORSRC:=2.7.1
define Download/libtensorflow
  URL:=https://github.com/tensorflow/tensorflow/archive/refs/tags/
  FILE:=v$(TENSORSRC).tar.gz
  HASH:=abebe2cf5ca379e18071693ca5f45b88ade941b16258a21cc1f12d77d5387a21
endef

$(eval $(call Download,libtensorflow))
define Build/Prepare
	$(PKG_UNPACK)
	tar -C $(PKG_BUILD_DIR) -zxf $(DL_DIR)/v$(TENSORSRC).tar.gz
	mv $(PKG_BUILD_DIR)/tensorflow-$(TENSORSRC) $(PKG_BUILD_DIR)/tensorflow
	mv $(PKG_BUILD_DIR)/tensorflow $(PKG_BUILD_DIR)/lib
	$(Build/Prepare/Default)
	( cd $(PKG_BUILD_DIR); $(STAGING_DIR)/opt/bin/phpize81 )
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./configure $(CONFIGURE_ARGS) --enable-tensorflow=yes --enable-shared=no )
endef

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME)))
$(eval $(call BuildPackage,$(PKG_NAME)))
