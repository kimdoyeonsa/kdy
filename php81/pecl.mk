#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Package/php81-pecl/Default
  SUBMENU:=php81
  SECTION:=lang
  CATEGORY:=Languages
  URL:=http://pecl.php.net/
  DEPENDS:=php81
endef

define Build/Prepare
	$(Build/Prepare/Default)
	$(if $(QUILT),,( cd $(PKG_BUILD_DIR); $(STAGING_DIR)/opt/bin/phpize81 ))
endef

define Build/Configure
	$(if $(QUILT),( cd $(PKG_BUILD_DIR); $(STAGING_DIR)/opt/bin/phpize81 ))
	$(Build/Configure/Default)
endef

CONFIGURE_VARS+= \
	ac_cv_c_bigendian_php=$(if $(CONFIG_BIG_ENDIAN),yes,no)

CONFIGURE_ARGS+= \
	--with-php-config=$(STAGING_DIR)/opt/bin/php81-config

define php81PECLPackage

  define Package/php81-pecl-$(1)
    $(call Package/php81-pecl/Default)
    TITLE:=$(2)

    ifneq ($(3),)
      DEPENDS+=$(3)
    endif

    VARIANT:=php81
  endef

  define Package/php81-pecl-$(1)/install
	$(INSTALL_DIR) $$(1)/opt/lib/php81
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/$(subst -,_,$(1)).so $$(1)/opt/lib/php81/
	$(INSTALL_DIR) $$(1)/opt/etc/php81
    ifeq ($(5),zend)
	echo "zend_extension=/opt/lib/php81/$(subst -,_,$(1)).so" > $$(1)/opt/etc/php81/$(if $(4),$(4),20)_$(subst -,_,$(1)).ini
    else
	echo "extension=$(subst -,_,$(1)).so" > $$(1)/opt/etc/php81/$(if $(4),$(4),20)_$(subst -,_,$(1)).ini
    endif
  endef

endef
