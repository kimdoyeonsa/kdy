#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=stats
PECL_LONGNAME:=stats
PKG_VERSION:=2.0.4
PKG_COMMIT:=fac78cf926bb00c9974379c7131c58b7545e5b15
PKG_RELEASE:=1
PKG_HASH:=805e21b6d29a60687a483d5009ce5d119a7d53f53c3a64de369086c7ec9adcfa

PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PKG_COMMIT).tar.gz
PKG_SOURCE_URL:=https://github.com/php/pecl-math-stats/archive

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/pecl-math-$(PECL_NAME)-$(PKG_COMMIT)
PKG_BUILD_PARALLEL:=1
HOST_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_ARGS+= \
--enable-stats



$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME)))
$(eval $(call BuildPackage,$(PKG_NAME)))
