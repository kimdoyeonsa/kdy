#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gettext-full
PKG_VERSION:=0.21
PKG_RELEASE:=2

PKG_SOURCE:=gettext-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@GNU/gettext
PKG_HASH:=d20fcbb537e02dcf1383197ba05bd0734ef7bf5db06bdb241eb69b7d16b73192
PKG_BUILD_DIR:=$(BUILD_DIR)/gettext-$(PKG_VERSION)
HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/gettext-$(PKG_VERSION)

PKG_MAINTAINER:=Jo-Philipp Wich <jo@mein.io>
PKG_LICENSE:=GPL-3.0-or-later
PKG_CPE_ID:=cpe:/a:gnu:gettext

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1
PKG_BUILD_DEPENDS:=gettext-full/host
PKG_BUILD_PARALLEL:=0
HOST_BUILD_PARALLEL:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk

define Package/libintl
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Stub header for the GNU Internationalization library
endef

define Package/gettext
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=gettext
  URL:=http://www.gnu.org/software/gettext/
  ABI_VERSION:=8
  DEPENDS:=+libgettext-full
endef
define Package/libtextstyle
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libtextstyle
  URL:=http://www.gnu.org/software/gettext/
  ABI_VERSION:=8
endef

define Package/libgettext-full
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libgettext
  URL:=http://www.gnu.org/software/gettext/
  ABI_VERSION:=8
  DEPENDS:=+libunistring +libxml2 +libintl-full +libtextstyle
endef

define Package/libintl-full
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=GNU Internationalization library
  URL:=http://www.gnu.org/software/gettext/
  ABI_VERSION:=8
endef

TARGET_CFLAGS += $(FPIC)
ifneq ($(HOST_OS),Linux)
  TARGET_CFLAGS += -I$(STAGING_DIR_HOSTPKG)/include
endif

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--disable-libasprintf \
	--disable-rpath \
	--enable-nls \
	--disable-java \
	--disable-openmp \
	--disable-curses \
	--with-included-gettext \
	--without-libintl-prefix \
	--without-libexpat-prefix \
	--without-emacs

HOST_CONFIGURE_ARGS += \
	--disable-shared \
	--enable-static \
	--disable-libasprintf \
	--disable-rpath \
	--disable-java \
	--disable-openmp \
	--without-emacs \
	--without-libxml2-prefix

HOST_CONFIGURE_VARS += \
	EMACS="no" \
	am_cv_lib_iconv=no \
	am_cv_func_iconv=no \
	ac_cv_header_iconv_h=no \

HOST_CFLAGS += $(HOST_FPIC)

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/lib/libintl-stub/include
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/opt/include/*.h $(1)/opt/lib/libintl-stub/include/
	$(INSTALL_DIR) $(1)/opt/lib/libintl-stub/include/textstyle
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/opt/include/textstyle/*.h $(1)/opt/lib/libintl-stub/include/textstyle
	$(INSTALL_DIR) $(1)/opt/lib/libintl-full/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/*.h $(1)/opt/lib/libintl-full/include/
	$(INSTALL_DIR) $(1)/opt/lib/libintl-full/include/textstyle
	$(CP) $(PKG_INSTALL_DIR)/opt/include/textstyle/*.h $(1)/opt/lib/libintl-full/include/textstyle
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.{a,la,so*} $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/libintl-full/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/*.{a,la,so*} $(1)/opt/lib/libintl-full/lib/
	$(INSTALL_DIR) $(1)/opt/share/aclocal
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/opt/share/aclocal/* $(1)/opt/share/aclocal/

	$(SED) '/read dummy/d' $(STAGING_DIR_HOSTPKG)/bin/gettextize
endef

define Package/libintl/install
	$(INSTALL_DIR) $(1)/opt/tmp
	touch $(1)/opt/tmp/.libintl-placeholder
endef
define Package/libtextstyle/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libtextstyle.{a,so*} $(1)/opt/lib
endef
define Package/libgettext-full/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libgettext*.{a,so*} $(1)/opt/lib
endef
define Package/libintl-full/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libintl.{a,so*} $(1)/opt/lib
endef
define Package/gettext/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(CP) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin
endef
$(eval $(call HostBuild))
$(eval $(call BuildPackage,libintl))
$(eval $(call BuildPackage,libtextstyle))
$(eval $(call BuildPackage,libgettext-full))
$(eval $(call BuildPackage,libintl-full))
$(eval $(call BuildPackage,gettext))

