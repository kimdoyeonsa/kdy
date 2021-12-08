#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=ssh2
PECL_LONGNAME:=ssh2

PKG_VERSION:=1.3.1
PKG_RELEASE:=1
PKG_HASH:=9093a1f8d24dc65836027b0e239c50de8d5eaebf8396bc3331fdd38c5d69afd9

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

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),libssh2,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
