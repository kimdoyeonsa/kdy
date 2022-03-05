#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=rdkafka
PECL_LONGNAME:=rdkafka

PKG_VERSION:=6.0.1
PKG_RELEASE:=1
PKG_HASH:=8a4abe701e593d1042c210746104f4b04b15ac98db6331848eed91acadfcf192

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
      --with-rdkafka=$(STAGING_DIR)/opt

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+librdkafka,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
