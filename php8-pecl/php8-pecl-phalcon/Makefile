#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=phalcon
PECL_LONGNAME:=phalcon
PKG_VERSION:=5.0.0alpha6
PKG_RELEASE:=1
PKG_HASH:=25c7fa262ae127b6c920ae9099c2c61dbe2ef16b3e48bf87e3fdc3bb195cec5a

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1
HOST_BUILD_PARALLEL:=1

PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

include $(INCLUDE_DIR)/nls.mk
include ../../php8/pecl.mk

CONFIGURE_ARGS+= \
--enable-phalcon  



$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+php8-mod-curl +php8-mod-fileinfo +php8-mod-gettext +php8-mod-mbstring +php8-mod-openssl +php8-mod-pdo +php8-mod-session +php8-pecl-psr,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
