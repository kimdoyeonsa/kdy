#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=componere
PECL_LONGNAME:=componere

PKG_VERSION:=3.1.2
PKG_RELEASE:=1
PKG_HASH:=6463f62ada13ee967928cceabda886262b0ad27b4994e0775b1f7c72ec2940db

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
      --enable-componere=yes \
	--enable-componere-coverage=yes


$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME)))
$(eval $(call BuildPackage,$(PKG_NAME)))
