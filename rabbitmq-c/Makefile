include $(TOPDIR)/rules.mk

PKG_NAME:=rabbitmq-c
PKG_VERSION:=0.11.0
PKG_RELEASE:=$(AUTORELEASE)
PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/alanxz/rabbitmq-c/archive/refs/tags/
PKG_HASH:=437d45e0e35c18cf3e59bcfe5dfe37566547eb121e69fca64b98f5d2c1c2d424

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/rabbitmq-c
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=rabbitmq-c
  URL:=https://github.com/alanxz/rabbitmq-c
  DEPENDS:=+libopenssl
endef

define Package/rabbitmq-c/description
 Announcements regarding the library are periodically made on the rabbitmq-c-users and cross-posted to rabbitmq-users.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/*.h $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/librabbitmq.{so*,a} $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/librabbitmq.pc $(1)/opt/lib/pkgconfig/
endef

define Package/rabbitmq-c/install
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/librabbitmq.so* $(1)/opt/lib/
endef

$(eval $(call BuildPackage,rabbitmq-c))
