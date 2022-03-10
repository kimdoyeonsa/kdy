#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=snappy
PECL_LONGNAME:=snappy

PKG_VERSION:=0.2.1
PKG_RELEASE:=1
PKG_HASH:=61116156243b41fe3bb332838960c7bacb58821bf98f70b50667d58c3e8462df

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/kjdev/php-ext-snappy/archive/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/php-ext-snappy-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
--prefix=/opt \
--enable-snappy \
--with-snappy-includedir=$(STAGING_DIR)/opt

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+php81-pecl-apcu +libsnappy,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
