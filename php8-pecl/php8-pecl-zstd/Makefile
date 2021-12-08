#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=zstd
PECL_LONGNAME:=zstd

PKG_VERSION:=0.11.0
PKG_RELEASE:=1
PKG_HASH:=5832e1b2d52de9668541e1193b572811232958a42dfda6bdc2c0529359bf552e

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php8/pecl.mk

CONFIGURE_ARGS+= \
	--enable-zstd \
      --with-libzstd=$(STAGING_DIR)/opt \
      --enable-coverage  

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),zstd,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
