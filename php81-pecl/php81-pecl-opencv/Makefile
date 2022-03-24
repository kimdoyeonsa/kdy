#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=opencv
PECL_LONGNAME:=opencv
PKG_COMMIT:=eeb64726981886f21e8c7ce0e4db94fbf20ebe56

PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_HASH:=5b3aa6f1b7b1397d26b96a7208e382a8d24678a9d40ea8a4c9a95d307ff0dff9

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PKG_COMMIT).tar.gz
PKG_SOURCE_URL:=https://github.com/php-opencv/php-opencv/archive

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/php-$(PECL_NAME)-$(PKG_COMMIT)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
--with-opencv=$(STAGING_DIR)/opt

CONFIGURE_VARS+= \
HAVE_OPENCV=1

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libstdcpp +opencv +libopencv,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
