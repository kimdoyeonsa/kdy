#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=yaml
PECL_LONGNAME:=yaml

PKG_VERSION:=2.2.2
PKG_RELEASE:=1
PKG_HASH:=119052f0461d57d86f44c252f9c9b2dd743486c701c1a0aba0aebecdd0d8b82a

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
--with-yaml=$(STAGING_DIR)/opt/lib
	

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),libyaml,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
