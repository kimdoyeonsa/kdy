#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=apcu
PECL_LONGNAME:=apcu

PKG_VERSION:=5.1.21
PKG_RELEASE:=1
PKG_HASH:=1033530448696ee7cadec85050f6df5135fb1330072ef2a74569392acfecfbc1

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
--enable-apcu=yes \
--enable-apcu-clear-signal=yes \
--enable-apcu-spinlocks=yes

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include/ext/apcu 
	$(CP) $(PKG_BUILD_DIR)/*.h $(1)/opt/include/ext/apcu
endef

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME)))
$(eval $(call BuildPackage,$(PKG_NAME)))


