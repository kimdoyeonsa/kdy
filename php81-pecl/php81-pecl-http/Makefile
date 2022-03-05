#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PECL_NAME:=pecl_http
PECL_LONGNAME:=Extended HTTP Support

PKG_VERSION:=4.2.2
PKG_RELEASE:=1a
PKG_HASH:=c338afd29259f0093f07f4e99b80705a2d5bb046c7ab32e5938eef29bbb63a6e

PKG_NAME:=php81-pecl-http
PKG_SOURCE:=$(PECL_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://pecl.php.net/get/

PKG_LICENSE:=BSD-2-Clause
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=php81 php81-pecl-raphf
PKG_BUILD_DIR:=$(BUILD_DIR)/pecl-php81/$(PECL_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include ../../php81/pecl.mk

CONFIGURE_VARS+= \
	PECL_cv_HAVE_EXT_propro=yes \
	PECL_cv_HAVE_EXT_raphf=yes \
	PECL_cv_HAVE_LIBCURL_ARES=yes \
	PECL_cv_HAVE_LIBCURL_OpenSSL=$(if $(CONFIG_LIBCURL_OPENSSL),yes,no) \
	PECL_cv_HAVE_LIBCURL_GnuTLS=$(if $(CONFIG_LIBCURL_GNUTLS),yes,no) \
	PECL_cv_HAVE_LIBCURL_NSS=yes \
	PECL_cv_HAVE_LIBCURL_SecureTransport=yes \
	PECL_cv_HAVE_LIBCURL_GSKit=yes \
	PECL_cv_HAVE_LIBCURL_PolarSSL=yes \
	PECL_cv_HAVE_LIBCURL_WolfSSL=$(if $(CONFIG_LIBCURL_WOLFSSL),yes,no) \
	PECL_cv_HAVE_LIBCURL_mbedTLS=$(if $(CONFIG_LIBCURL_MBEDTLS),yes,no) \
	PECL_cv_HAVE_LIBCURL_axTLS=yes \
	PECL_cv_LIBCURL_TLSAUTH_SRP=$(if $(CONFIG_LIBCURL_TLS_SRP),yes,no) \
	PECL_cv_HAVE_curl_curl_h_CURL_LOCK_DATA_SSL_SESSION=yes \
	PECL_cv_LIBCURL_SHARE_SSL=yes \
	PECL_cv_LIBCURL_TLS13_CIPHERS=$(if $(CONFIG_OPENSSL_WITH_TLS13),yes,no) \


CONFIGURE_ARGS+= \
	--with-http \
	--without-http-shared-deps \
	--with-http-zlib-dir="$(STAGING_DIR)/opt" \
	--with-http-libcurl-dir="$(STAGING_DIR)/opt" \
	--with-http-libevent-dir="$(STAGING_DIR)/opt" \
	--with-http-libidn-dir="$(STAGING_DIR)/opt" \
	--with-http-libidnkit-dir=no \
	--with-http-libidnkit2-dir=no

$(eval $(call PHP81PECLPackage,http,$(PECL_LONGNAME),+libcares +icu +libcurl +librt +libevent2 +PACKAGE_libidn:libidn +libidn2 +php81-mod-iconv +php81-mod-session +php81-pecl-raphf +php81-pecl-propro,30))
$(eval $(call BuildPackage,$(PKG_NAME)))
