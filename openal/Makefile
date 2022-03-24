include $(TOPDIR)/rules.mk

PKG_NAME:=openal
PKG_VERSION:=1.21.1
PKG_RELEASE:=$(AUTORELEASE)

PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/kcat/openal-soft/archive/refs/tags/
PKG_HASH:=8ac17e4e3b32c1af3d5508acfffb838640669b4274606b7892aa796ca9d7467f
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-soft-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1
PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_OPTIONS+= \
-DALSOFT_STATIC_LIBGCC=ON \
-DALSOFT_STATIC_STDCXX=ON

define Package/openal
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=openal
  URL:=https://opencv.org/
  DEPENDS:=+libopenal
endef

define Package/libopenal
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=openal
  DEPENDS:=+qt5-widgets +qt5-core +libstdcpp +libatomic
endef

define Package/openal/description
	OpenAL Soft is a software implementation of the OpenAL 3D audio API.
endef

define Build/InstallDev
	$(INSTALL_DIR)	$(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/AL	$(1)/opt/include/
	$(INSTALL_DIR)	$(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/cmake	$(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libopenal.so*	$(1)/opt/lib/
	$(INSTALL_DIR)	$(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/openal.pc	$(1)/opt/lib/pkgconfig
endef

define Package/openal/install
	$(INSTALL_DIR)	$(1)/opt/bin
	$(CP) $(PKG_INSTALL_DIR)/opt/bin/*	$(1)/opt/bin/
endef

define Package/libopenal/install
	$(INSTALL_DIR)	$(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libopenal.so*	$(1)/opt/lib/
endef

$(eval $(call BuildPackage,openal))
$(eval $(call BuildPackage,libopenal))
