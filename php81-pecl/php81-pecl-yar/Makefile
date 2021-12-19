#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=yar
PECL_LONGNAME:=yar

PKG_VERSION:=2.2.1
PKG_RELEASE:=1
PKG_HASH:=1d52faa6a4b14b77cd2654d7b4a14ff8d8f587049d03dbcc693c3a2321e7c12e

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
      --enable-yar=yes \
      --with-curl=$(STAGING_DIR)/opt \
	--enable-epoll=yes
        


$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),curl,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
