#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=lzf
PECL_LONGNAME:=lzf

PKG_VERSION:=1.7.0
PKG_RELEASE:=1
PKG_HASH:=f9a51510ab52da51c2b39ba9329036247a3784b3a32788cbf199326b90f8bc78

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=LZF-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/
PKG_BUILD_DEPENDS:=php81

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/LZF-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
	--enable-lzf \
	--enable-lzf-better-compression \
	--with-liblzf=$(STAGING_DIR)/opt


$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),liblzf,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
