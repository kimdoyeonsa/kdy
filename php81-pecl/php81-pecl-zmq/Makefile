#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=zmq
PECL_LONGNAME:=zmq

PKG_VERSION:=1.1.4
PKG_RELEASE:=1
PKG_COMMIT:=43464c42a6a47efdf8b7cab03c62f1622fb5d3c6
PKG_HASH:=cbf1d005cea35b9215e2830a0e673b2edd8b526203f731de7a7bf8f590a60298

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PKG_COMMIT).tar.gz
PKG_SOURCE_URL:=https://github.com/zeromq/php-zmq/archive

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/php-$(PECL_NAME)-$(PKG_COMMIT)

PKG_BUILD_PARALLEL:=1


PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk


CONFIGURE_ARGS+= \
--with-zmq=shared,"$(STAGING_DIR)/opt/lib"

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libzmq,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
