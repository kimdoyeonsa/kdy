#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=xmlrpc
PECL_LONGNAME:=xmlrpc
PKG_VERSION:=1.0.0RC3
PKG_RELEASE:=1
PKG_HASH:=65ce03491782f9d9d5e9bc70bfe684255e5afa8486a2960c7a7cab033882a282
PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1


PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
--with-xml=$(STAGING_DIR)/opt 

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libxml2-dev,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
