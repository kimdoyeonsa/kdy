#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=tensor
PECL_LONGNAME:=tensor
PKG_VERSION:=3.0.1
PKG_RELEASE:=1

PKG_HASH:=48fd11aae38289eeb0766810fa722d2a416c38550fc38eabfa64080b90f776a6
PKG_NAME:=php81-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/RubixML/Tensor/archive/refs/tags/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/Tensor-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

define Build/Prepare
	$(Build/Prepare/Default)
	( cd $(PKG_BUILD_DIR)/ext; $(STAGING_DIR)/opt/bin/phpize81 )
endef


define Build/Configure
	( cd $(PKG_BUILD_DIR)/ext; ./configure $(CONFIGURE_ARGS) --enable-tensor=yes )
endef

define Build/Compile
+$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR)/ext \
		DESTDIR="$(PKG_INSTALL_DIR)"
	$(MAKE) -C $(PKG_BUILD_DIR)/ext \
		DESTDIR="$(PKG_INSTALL_DIR)" install 
	$(CP)  $(PKG_BUILD_DIR)/ext/modules $(PKG_BUILD_DIR)
endef

$(eval $(call PHP81PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+LAPACK +openblas,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
