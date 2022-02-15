#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=amqp
PECL_LONGNAME:=amqp

PKG_VERSION:=1.11.0
PKG_RELEASE:=1
PKG_HASH:=dc5212b4785f59955118a219bbfbcedb7aa6ab2a91e8038a0ad1898f331c2f08

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
	ac_cv_librabbitmq_version=0.11.0

CONFIGURE_ARGS+= \
	--with-librabbitmq-dir=$(STAGING_DIR)/opt

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+rabbitmq-c,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
