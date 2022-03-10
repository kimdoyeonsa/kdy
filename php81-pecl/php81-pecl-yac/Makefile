#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=yac
PECL_LONGNAME:=yac

PKG_VERSION:=2.3.1
PKG_RELEASE:=1
PKG_HASH:=6225f526a2c68ebe30b528eebbcb42d2e4d42bb971ab9b13829ac47c36401494

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://pecl.php.net/get

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
	--enable-yac=yes \
	--with-system-fastlz=$(STAGING_DIR)/opt/include \
	--enable-json=yes \
	--enable-msgpack=yes \
	--enable-igbinary=yes 
	
CONFIGURE_VARS+= \
HAVE_SHM_MMAP_ANON=1



$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+php81 +php81-mod-opcache +php81-pecl-igbinary +php81-pecl-msgpack +libfastlz,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
