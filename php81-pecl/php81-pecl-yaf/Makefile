#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=yaf
PECL_LONGNAME:=yaf
PECL_COMMIT:=12478af73aa42d68f3a0712ddd6a73e0268b4d13

PKG_VERSION:=3.3.3
PKG_RELEASE:=1
PKG_HASH:=fe8c38c7749bbe1d15a45885c3711e9223b6689ef8c6917eaedd89401ae1cb63

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_COMMIT).tar.gz
PKG_SOURCE_URL:=https://github.com/laruence/yaf/archive/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/$(PECL_NAME)-$(PECL_COMMIT)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
      --enable-yaf=yes

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME)))
$(eval $(call BuildPackage,$(PKG_NAME)))
