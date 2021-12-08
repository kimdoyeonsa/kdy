#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=xz
PECL_LONGNAME:=xz

PKG_VERSION:=1.1.2
PKG_RELEASE:=1
PKG_HASH:=a254abd1dc93effdc570aaac3bbbcd713b0b5675f0123cd6b466abb065fa927f

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/codemasher/php-ext-xz/archive/refs/tags

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/php-ext-xz-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
--with-xz=shared,"$(STAGING_DIR)/opt/lib"

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),liblzma,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
