include $(TOPDIR)/rules.mk

PKG_NAME:=libcouchbase
PKG_VERSION:=3.2.4
PKG_RELEASE:=1

PKG_LICENSE:=BSD-3-Clause

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/couchbase/libcouchbase/releases/download/$(PKG_VERSION)/
PKG_HASH:=ac5774695906d5482ea5d92cc9e47826eb979c6a784114a259bd748aa4774c3a

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_OPTIONS+= \
-DLCB_USE_COVERAGE=ON \
-DLCB_STATIC_LIBEVENT=ON 

define Package/couchbase
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=couchbase
  DEPENDS:=+libcouchbase
endef

define Package/libcouchbase
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libcouchbase
  URL:=https://github.com/couchbase/libcouchbase
  DEPENDS:=+libstdcpp +libasan +zlib +libopenssl +libevent2-core +libev +libuv
endef

define Package/libcouchbase/description
	This is the C client library for Couchbase It communicates with the cluster and speaks the relevant protocols necessary to connect to the cluster and execute data operations.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_INSTALL_DIR)/opt/include/* $(1)/opt/include/
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libcouchbase.so* $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/libcouchbase
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libcouchbase/libcouchbase_*.so* $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/pkgconfig/libcouchbase.pc $(1)/opt/lib/pkgconfig
endef

define Package/libcouchbase/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libcouchbase.so* $(1)/opt/lib/
	$(INSTALL_DIR) $(1)/opt/lib/
	$(CP) $(PKG_INSTALL_DIR)/opt/lib/libcouchbase/libcouchbase_*.so* $(1)/opt/lib/
endef

define Package/couchbase/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(CP) $(PKG_INSTALL_DIR)/opt/bin/* $(1)/opt/bin/
endef


$(eval $(call BuildPackage,libcouchbase))
$(eval $(call BuildPackage,couchbase))
