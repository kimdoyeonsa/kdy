#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=fann
PECL_LONGNAME:=fann
PKG_VERSION:=1.2.0RC2
PKG_RELEASE:=1
PKG_HASH:=685107b4557d96bf76a2b09d778a619968c3642f0bae81f11774b276dc2bcff6

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
--with-fann=$(STAGING_DIR)/opt

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libfann,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
