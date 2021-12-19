#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=mongodb
PECL_LONGNAME:=mongodb

PKG_VERSION:=1.12.0
PKG_RELEASE:=1
PKG_HASH:=0d9f670b021288bb6c9b060979f191f1da773d729100673166f38b617e24317e

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
--enable-mongodb \
--enable-mongodb-coverage=yes

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libsasl2 +libsasl2-sasldb +icu +libopenssl +libzstd +libsnappy,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
