#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=solr
PECL_LONGNAME:=solr

PKG_VERSION:=2.5.1
PKG_RELEASE:=1
PKG_HASH:=2b41601e74fe371e6525579637a8ddff270e58a0ff636e7f56df8919d6e7777d

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
      --with-curl=$(STAGING_DIR)/opt \
	--enable-solr \
	--enable-solr-debug \   
      --with-libxml-dir=$(STAGING_DIR)/opt/lib \
	--enable-coverage \
	--enable-libxml


$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+curl,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
