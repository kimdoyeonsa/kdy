#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=yar
PECL_LONGNAME:=yar

PKG_VERSION:=2.2.0
PKG_RELEASE:=1
PKG_HASH:=0bb174575c523549bd8b1b847a55a2edc9b533a8043ed7b3df26dacb9d2fa07d

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
