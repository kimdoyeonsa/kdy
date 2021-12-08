#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=propro
PECL_LONGNAME:=Property proxy
PKG_COMMIT:=921871c048332818704008ce7b67f8f2e32d3cf4
PKG_VERSION:=2.1.1
PKG_RELEASE:=1
PKG_HASH:=acf576b2a7636110a965c89fc27de9203dfccb4c223c700e81276f6b9240bb9a

PKG_NAME:=php8-pecl-propro
PKG_SOURCE:=$(PKG_COMMIT).tar.gz
PKG_SOURCE_URL:=https://github.com/m6w6/ext-propro/archive

PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>

PKG_LICENSE:=BSD-2-Clause
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/ext-$(PECL_NAME)-$(PKG_COMMIT)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php8/pecl.mk

CONFIGURE_ARGS+= \
	--enable-propro

define Build/InstallDev
	$(CP) $(PKG_BUILD_DIR)/php_propro.h $(PKG_BUILD_DIR)/opt/include/php8/ext/$(PECL_NAME)/
	$(CP) $(PKG_BUILD_DIR)/php_propro_api.h $(PKG_BUILD_DIR)/include/php8/ext/$(PECL_NAME)/
endef

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+php8-pecl-http))
$(eval $(call BuildPackage,$(PKG_NAME)))
