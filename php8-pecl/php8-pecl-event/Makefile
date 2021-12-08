#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=event
PECL_LONGNAME:=event

PKG_VERSION:=3.0.7RC1
PKG_RELEASE:=1
PKG_HASH:=fe708604a718ec2b8ec752e13fcbb870afb8b3516565dccda06af049d9314af4

PKG_NAME:=php8-pecl-$(PECL_NAME)
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php8/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>

PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../php8/pecl.mk

CONFIGURE_ARGS+= \
	--with-event-core \
      --with-event-extra \
      --with-event-openssl \
      --with-event-pthreads \
      --with-openssl-dir=$(STAGING_DIR)/opt \
      --with-event-libevent-dir=$(STAGING_DIR)/opt/lib \
      --enable-event-sockets \
      --enable-event-debug

$(eval $(call PHP8PECLPackage,$(PECL_NAME),$(PECL_LONGNAME),+libevent2 +libevent2-core +libevent2-extra +libevent2-openssl +libevent2-pthreads +libopenssl +php8-mod-sockets,25))
$(eval $(call BuildPackage,$(PKG_NAME)))
