#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=couchbase
PECL_LONGNAME:=couchbase

PKG_VERSION:=3.2.2
PKG_RELEASE:=1
PKG_HASH:=d8bd785ccce818e0beb9694cd02ab01ed26e0cf9b19217d2bc2e92b38b21c9c1

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

CONFIGURE_VARS+= \
	LIBCOUCHBASE_DIR=$(STAGING_DIR)/opt

CONFIGURE_ARGS+= \
	--with-couchbase=$(STAGING_DIR)/opt \
	--with-system-fastlz=yes

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libcouchbase +libfastlz,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
