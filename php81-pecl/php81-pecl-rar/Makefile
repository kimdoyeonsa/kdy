#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=rar
PECL_LONGNAME:=rar

PKG_COMMIT:=ab26d285759e4c917879967b09976a44829ed570
PKG_VERSION:=4.2.0
PKG_RELEASE:=1
PKG_HASH:=340d6895c53bfcdb9eb89ff176d709d7bdb2d87fe24fb0a4db300e0ce7a45a58

PKG_NAME:=php81-pecl-rar
PKG_SOURCE:=$(PKG_COMMIT).tar.gz
PKG_SOURCE_URL:=http://github.com/cataphract/php-rar/archive/

PKG_LICENSE:=BSD-2-Clause
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/php-$(PECL_NAME)-$(PKG_COMMIT)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
--enable-rar

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libstdcpp,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
