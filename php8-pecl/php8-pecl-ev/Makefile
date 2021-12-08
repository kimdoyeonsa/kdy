#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=ev
PECL_LONGNAME:=ev

PKG_VERSION:=1.1.6RC1
PKG_RELEASE:=1
PKG_HASH:=86342c43c80fe7411c16339107ba522142416eb9ba66bcb16134a2f7f94c02ef

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
      --enable-ev \
      --enable-ev-debug

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+php8-mod-sockets +php8-mod-pcntl +php8 +libev,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
