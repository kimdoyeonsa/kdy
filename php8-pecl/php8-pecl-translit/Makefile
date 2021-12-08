#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=translit
PECL_LONGNAME:=translit
PKG_COMMIT=3e18190e94f1b231ef0c4027673484e4191a49bf
PKG_VERSION:=0.7.1
PKG_RELEASE:=1
PKG_HASH:=26a1df076beed3c3b7a60f69be9d09a972877f7869d5fd142b47d31ff1978fcd

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PKG_COMMIT).tar.gz
PKG_SOURCE_URL:=https://github.com/derickr/pecl-translit/archive

PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>

PKG_LICENSE:=BSD-2-Clause
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/pecl-$(PECL_NAME)-$(PKG_COMMIT)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php8/pecl.mk

CONFIGURE_ARGS+= \
	 --enable-translit


$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME)))
$(eval $(call BuildPackage,$(PKG_NAME)))
