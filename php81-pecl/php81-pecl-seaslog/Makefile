#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=seaslog
PECL_LONGNAME:=seasloag

PKG_VERSION:=2.2.0
PKG_RELEASE:=1
PKG_HASH:=e40a1067075b1e0bcdfd5ff98647b9f83f502eb6b2a3d89e67b067704ea127da

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=SeasLog-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/SeasLog-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
	--with-seaslog

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME)))
$(eval $(call BuildPackage,$(PKG_NAME)))
