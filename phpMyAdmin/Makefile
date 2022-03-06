include $(TOPDIR)/rules.mk

PKG_NAME:=phpMyAdmin
PKG_VERSION:=5.1.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-all-languages.tar.xz
PKG_SOURCE_URL:=https://files.phpmyadmin.net/$(PKG_NAME)/$(PKG_VERSION)/
PKG_HASH:=c562feddc0f8ff5e69629113f273a0d024a65fb928c48e89ce614744d478296f
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-all-languages

PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/phpMyAdmin
  SUBMENU:=PHP81
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=phpMyAdmin
  URL:=https://files.phpmyadmin.net/
  DEPENDS:=+nginx
endef

define Package/phpMyAdmin/description
  Bringing MySQL to the web
endef

define Build/Configure
	( cp $(PKG_BUILD_DIR)/libraries/config.default.php $(PKG_BUILD_DIR)/config.inc.php)
endef

define Build/Compile
endef

define Build/Install
	
endef

MAKE_FLAGS +=

define Package/phpMyAdmin/install
	$(INSTALL_DIR) $(1)/opt/share/nginx/html/phpMyAdmin
	$(CP) $(PKG_BUILD_DIR)/{*.php,*.json,*.css,*.lock,robots.txt,favicon.ico,doc,examples,js,libraries,locale,setup,sql,templates,themes,vendor} $(1)/opt/share/nginx/html/phpMyAdmin
endef

$(eval $(call BuildPackage,phpMyAdmin))
