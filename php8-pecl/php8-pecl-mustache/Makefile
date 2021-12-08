#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=mustache
PECL_LONGNAME:=mustache

PKG_VERSION:=0.9.2
PKG_RELEASE:=1
PKG_HASH:=a37fbf01f764d0a035fa8c8ee0030057285199b9a681875a1e021761df6d59e0

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

TARGET_CXXFLAGS += -std=c++11 -std=c++0x

CONFIGURE_VARS+= \
	ax_cv_cxx_compile_cxx11=yes

CONFIGURE_ARGS+= \
	--enable-mustache \
	--with-libmustache=shared,$(STAGING_DIR)/opt

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libmustache +libstdcpp,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
