#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=simple_kafka_client
PECL_LONGNAME:=simple_kafka_client
PKG_VERSION:=0.1.4

PKG_RELEASE:=1
PKG_HASH:=f3f6a6583d044e5304f1518d123e4323f2de3251a8cf45fd66ecc28209190c72

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1
HOST_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
--with-simple-kafka-client=$(STAGAING_DIR)/opt

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+librdkafka,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
