#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=pdlib
PECL_LONGNAME:=pdlib
PKG_VERSION:=1.0.2
PKG_RELEASE:=1
PKG_HASH:=e91a3c7396ee2027f957fa34fcc2567e614e4e1c1570ae7d5d16d4203541ba4a

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/goodspb/$(PECL_NAME)/archive/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+dlib,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
