#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=xdiff
PECL_LONGNAME:=xdiff

PKG_VERSION:=2.1.0
PKG_RELEASE:=1
PKG_HASH:=2218e8e72e39a29620d78202d36327a6c50189b69ecc4e96ca57cdeb1efd5f0d

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
--with-xdiff=$(STAGING_DIR)/opt 

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libxdiff,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
