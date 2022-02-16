#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=php
PKG_VERSION:=8.1.2
PKG_RELEASE:=1

PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>
PKG_LICENSE:=PHP-3.01
PKG_LICENSE_FILES:=LICENSE
PKG_CPE_ID:=cpe:/a:php:php

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://www.php.net/distributions/
PKG_HASH:=6b448242fd360c1a9f265b7263abf3da25d28f2b2b0f5465533b69be51a391dd

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

php81_MODULES= \
	bcmath bz2 \
	calendar ctype curl \
	dom \
	exif enchant\
	ffi fileinfo filter ftp \
	gettext gd gmp \
	iconv imap intl \
	json \
	ldap \
	mbstring mysqli mysqlnd \
	opcache openssl \
	pcntl pdo pdo-mysql pdo-pgsql pdo-dlib pdo-sqlite pgsql phar \
	session shmop sodium simplexml snmp soap sockets sqlite3 sysvmsg sysvsem sysvshm \
	tidy tokenizer \
	xml xmlreader xmlwriter \
	zip

PKG_CONFIG_DEPENDS:= \
	$(patsubst %,CONFIG_PACKAGE_php81-mod-%,$(php81_MODULES)) \
	CONFIG_php81_LIBXML CONFIG_php81_SYSTEMTZDATA CONFIG_PACKAGE_php81-apache

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/php81/Default
  SUBMENU:=PHP81
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=php81 Hypertext preprocessor
  URL:=http://www.php.net/
  DEPENDS:=php81
endef

define Package/php81/Default/description
  PHP is a widely-used general-purpose scripting language that is especially
  suited for Web development and can be embedded into HTML.
endef

define Package/php81/config
	config php81_LIBXML
		bool "php81 LIBXML support"
		depends on PACKAGE_php81-cli || PACKAGE_php81-cgi

	config php81_SYSTEMTZDATA
		bool "Use system timezone data instead of php's built-in database"
		depends on PACKAGE_php81-cli || PACKAGE_php81-cgi
		default y
		help
			Enabling this feature automatically selects the zoneinfo-core package
			which contains data for UTC timezone. To use other timezones you have
			to install the corresponding zoneinfo-... package(s).
endef

define Package/php81
  $(call Package/php81/Default)

  DEPENDS:=+libpcre2 +libtidy +zlib +bzip2 +libedit +libncursesw \
           +php81_LIBXML:libxml2 \
           +php81_LIBXSL:libxslt \
           +php81_SYSTEMTZDATA:zoneinfo-core
#  CONFLICTS:=php8
endef

define Package/php81/description
  $(call Package/php81/Default/description)
  This package contains only the PHP config file. You must actually choose
  your PHP flavour (cli, cgi or fastcgi).

  Please note, that installing php5 and php81 in parallel on the same target
  is not supported in OpenWrt/LEDE/Entware.
endef

define Package/php81-dev
  $(call Package/php81/Default)
  DEPENDS+= +libaspell +libcurl +uw-imap +libstdcpp +libenchant2 +libexslt +libffi +libgd-full +libgmp +libnetsnmp +libpam +libpq +libopenldap +libsasl2 +libsodium +libsqlite3 +libzip +oniguruma +libfreetds
  TITLE+= (dev)
endef

define Package/php81-cli
  $(call Package/php81/Default)
  DEPENDS+= +PACKAGE_php81-mod-intl:libstdcpp
  TITLE+= (CLI)
endef

define Package/php81-cli/description
  $(call Package/php81/Default/description)
  This package contains the CLI version of the php81 interpreter.
endef

define Package/php81-cgi
  $(call Package/php81/Default)
  DEPENDS+= +PACKAGE_php81-mod-intl:libstdcpp
  TITLE+= (CGI & FastCGI)
endef

define Package/php81-cgi/description
  $(call Package/php81/Default/description)
  This package contains the CGI version of the php81 interpreter.
endef

define Package/php81-fastcgi
  $(call Package/php81/Default)
  DEPENDS+= +php81-cgi 
  TITLE:=FastCGI startup script
endef

define Package/php81-fastcgi/description
  As FastCGI support is now a core feature the php81-fastcgi package now depends
  on the php81-cgi package, containing just the startup script.
endef

define Package/php81-fpm
  $(call Package/php81/Default)
  DEPENDS+= +PACKAGE_php81-mod-intl:libstdcpp
  TITLE+= (FPM)
endef

define Package/php81-fpm/description
  $(call Package/php81/Default/description)
  This package contains the FastCGI Process Manager of the php81 interpreter.
endef

define Package/php81-dbg
  $(call Package/php81/Default)
  DEPENDS+= +PACKAGE_php81-mod-intl:libstdcpp
  TITLE+= (DBG)
endef

define Package/php81-litespeed
  $(call Package/php81/Default)
  DEPENDS+= +PACKAGE_php81-mod-intl:libstdcpp
  TITLE+= (litespeed)
endef

define Package/php81-embed
  $(call Package/php81/Default)
  DEPENDS+= +PACKAGE_php81-mod-intl:libstdcpp
  TITLE+= (embed)
endef

define Package/php81-mod-intl/config
  config php81_FULLICUDATA
	bool "Add dependency to full ICU Data"
	depends on PACKAGE_php81-mod-intl
	default n
endef

define Package/php81-mod-intl/description
  Note that this package depends in ICU library which is built without data
  by default. This is to satisfy programs build and run dependencies but to
  keep the installed footprint small on the target system(s).
  However, the data is required to make the ICU library useful - and thus
  directly affects PHPs ICU extension, too - so consider to also
  select/install package 'icu-full-data'.
endef

define Package/php81-apache
  $(call Package/php81/Default)
  DEPENDS+=PACKAGE_php81-apache:apache \
	   +PACKAGE_php81-mod-intl:libstdcpp \
	   +libpcre2 +zlib
  TITLE:=PHP8 module for Apache Web Server
endef

define Package/php81-apache/description
  $(call Package/php81/Default/description)
  This package contains the PHP module for the Apache Web Server.
endef

# not everything groks --disable-nls
DISABLE_NLS:=

CONFIGURE_ARGS+= \
	--enable-cli \
	--enable-cgi \
	--enable-fpm \
	--enable-shared \
	--disable-static \
	--with-pic \
	--disable-rpath \
	--disable-debug \
	--enable-json=shared \
	--with-libedit \
	--enable-phpdbg \
	--enable-phpdbg-webhelper \
	--enable-phpdbg-debug \
	--enable-phpdbg-readline=yes \
	--enable-litespeed \
	--enable-fuzzer-msan \
	--enable-embed \
	--without-pear \
	\
	--with-config-file-path=/opt/etc \
	--with-config-file-scan-dir=/opt/etc/php81 \
	--disable-short-tags \
	\
	--without-valgrind \
	--with-external-pcre
	
ifeq ($(CONFIG_LIBC_USE_GLIBC),y)
TARGET_LDFLAGS += -ldl

# XXX Entware specific: fixed issue #693
TARGET_LDFLAGS += -lresolv
endif	

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-tidy),)
  CONFIGURE_ARGS+= --with-tidy=shared,"$(STAGING_DIR)/opt"
else
  CONFIGURE_ARGS+= --without-tidy
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-enchant),)
  CONFIGURE_ARGS+= --with-enchant=shared,"$(STAGING_DIR)/opt"
else
  CONFIGURE_ARGS+= --without-enchant
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-bz2),)
  CONFIGURE_ARGS+= --with-bz2=shared,"$(STAGING_DIR)/opt"
else
  CONFIGURE_ARGS+= --without-bz2
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-zlib),)
  CONFIGURE_ARGS+= --with-zlib=shared,"$(STAGING_DIR)/opt" 
else
  CONFIGURE_ARGS+= --without-zlib
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-bcmath),)
  CONFIGURE_ARGS+= --enable-bcmath=shared
else
  CONFIGURE_ARGS+= --disable-bcmath
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-calendar),)
  CONFIGURE_ARGS+= --enable-calendar=shared
else
  CONFIGURE_ARGS+= --disable-calendar
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-ctype),)
  CONFIGURE_ARGS+= --enable-ctype=shared
else
  CONFIGURE_ARGS+= --disable-ctype
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-curl),)
  CONFIGURE_ARGS+= --with-curl=shared
else
  CONFIGURE_ARGS+= --without-curl
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-dom),)
  CONFIGURE_ARGS+= --enable-dom=shared
else
  CONFIGURE_ARGS+= --disable-dom
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-exif),)
  CONFIGURE_ARGS+= --enable-exif=shared
else
  CONFIGURE_ARGS+= --disable-exif
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-ffi),)
  CONFIGURE_ARGS+= --with-ffi=shared
else
  CONFIGURE_ARGS+= --without-ffi
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-fileinfo),)
  CONFIGURE_ARGS+= --enable-fileinfo=shared,"$(STAGING_DIR)/opt"
else
  CONFIGURE_ARGS+= --disable-fileinfo
endif
ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-sodium),)
  CONFIGURE_ARGS+= --with-sodium=shared
else
  CONFIGURE_ARGS+= --without-sodium
endif
ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-filter),)
  CONFIGURE_ARGS+= --enable-filter=shared,"$(STAGING_DIR)/opt"
else
  CONFIGURE_ARGS+= --disable-filter
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-ftp),)
  CONFIGURE_ARGS+= --enable-ftp=shared
else
  CONFIGURE_ARGS+= --disable-ftp
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-gd),)
  CONFIGURE_ARGS+= \
	--enable-gd=shared,"$(STAGING_DIR)/opt" \
	--with-external-gd
else
  CONFIGURE_ARGS+= --disable-gd
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-gettext),)
  CONFIGURE_ARGS+= --with-gettext=shared,"$(STAGING_DIR)/opt/lib/libintl-full"
else
  CONFIGURE_ARGS+= --without-gettext
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-gmp),)
  CONFIGURE_ARGS+= --with-gmp=shared,"$(STAGING_DIR)/opt"
else
  CONFIGURE_ARGS+= --without-gmp
endif


ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-iconv),)
  CONFIGURE_ARGS+= --with-iconv=shared,"$(ICONV_PREFIX)"
else
  CONFIGURE_ARGS+= --without-iconv
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-imap),)
  CONFIGURE_ARGS+= \
		--with-imap=shared,"$(STAGING_DIR)/opt" \
		--with-kerberos=yes \
		--with-imap-ssl="$(STAGING_DIR)/opt"
else
  CONFIGURE_ARGS+= --without-imap
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-intl),)
  CONFIGURE_ARGS+= --enable-intl=shared
  TARGET_CXXFLAGS+= -std=c++0x
else
  CONFIGURE_ARGS+= --disable-intl
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-ldap),)
  CONFIGURE_ARGS+= \
	--with-ldap=shared,"$(STAGING_DIR)/opt" \
	--with-ldap-sasl
else
  CONFIGURE_ARGS+= --without-ldap
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-mbstring),)
  CONFIGURE_ARGS+= \
	--enable-mbstring=shared \
	--enable-mbregex
else
  CONFIGURE_ARGS+= --disable-mbstring
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-mysqli),)
  CONFIGURE_ARGS+= --with-mysqli=shared
else
  CONFIGURE_ARGS+= --without-mysqli
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-mysqlnd),)
  CONFIGURE_ARGS+= --enable-mysqlnd=shared
else
  CONFIGURE_ARGS+= --disable-mysqlnd
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-opcache),)
  CONFIGURE_ARGS+= --enable-opcache=shared --enable-opcache-jit=yes
else
  CONFIGURE_ARGS+= --disable-opcache
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-openssl)$(CONFIG_PACKAGE_php81-mod-ftp)$(CONFIG_PACKAGE_php81-mod-imap)$(CONFIG_PACKAGE_php81-mod-snmp),)
  CONFIGURE_ARGS+= \
	--with-openssl=shared \
	--with-kerberos=no \
	--with-openssl-dir="$(STAGING_DIR)/opt"
else
  CONFIGURE_ARGS+= --without-openssl
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-pcntl),)
  CONFIGURE_ARGS+= --enable-pcntl=shared
else
  CONFIGURE_ARGS+= --disable-pcntl
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-pdo),)
  CONFIGURE_ARGS+= --enable-pdo=shared
else
  CONFIGURE_ARGS+= --disable-pdo
endif
  ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-pdo-mysql),)
    CONFIGURE_ARGS+= --with-pdo-mysql=shared
  else
    CONFIGURE_ARGS+= --without-pdo-mysql
  endif
  ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-pdo-pgsql),)
    CONFIGURE_ARGS+= --with-pdo-pgsql=shared,"$(STAGING_DIR)/opt"
  else
    CONFIGURE_ARGS+= --without-pdo-pgsql
  endif
  ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-pdo-dblib),)
    CONFIGURE_ARGS+= --with-pdo-dblib=shared,"$(STAGING_DIR)/opt"
  else
    CONFIGURE_ARGS+= --without-pdo-dblib
  endif
  ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-pdo-sqlite),)
    CONFIGURE_ARGS+= --with-pdo-sqlite=shared
  else
    CONFIGURE_ARGS+= --without-pdo-sqlite
  endif
  
ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-pgsql),)
  CONFIGURE_ARGS+= --with-pgsql=shared,"$(STAGING_DIR)/opt"
else
  CONFIGURE_ARGS+= --without-pgsql
endif  

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-xsl),)
  CONFIGURE_ARGS+= --with-xsl=shared,"$(STAGING_DIR)/opt/lib"
else
  CONFIGURE_ARGS+= --without-xsl
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-phar),)
  CONFIGURE_ARGS+= --enable-phar=shared
else
  CONFIGURE_ARGS+= --disable-phar
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-session),)
  CONFIGURE_ARGS+= --enable-session=shared
else
  CONFIGURE_ARGS+= --disable-session
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-shmop),)
  CONFIGURE_ARGS+= --enable-shmop=shared
else
  CONFIGURE_ARGS+= --disable-shmop
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-simplexml),)
  CONFIGURE_ARGS+= --enable-simplexml=shared
else
  CONFIGURE_ARGS+= --disable-simplexml
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-pspell),)
  CONFIGURE_ARGS+= --with-pspell=shared,"$(STAGING_DIR)/opt"
else
  CONFIGURE_ARGS+= --without-pspell
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-snmp),)
  CONFIGURE_ARGS+= --with-snmp=shared,"$(STAGING_DIR)/opt"
else
  CONFIGURE_ARGS+= --without-snmp
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-soap),)
  CONFIGURE_ARGS+= --enable-soap=shared
else
  CONFIGURE_ARGS+= --disable-soap
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-sockets),)
  CONFIGURE_ARGS+= --enable-sockets=shared
else
  CONFIGURE_ARGS+= --disable-sockets
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-sqlite3),)
  CONFIGURE_ARGS+= --with-sqlite3=shared
else
  CONFIGURE_ARGS+= --without-sqlite3
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-sysvmsg),)
  CONFIGURE_ARGS+= --enable-sysvmsg=shared
else
  CONFIGURE_ARGS+= --disable-sysvmsg
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-sysvsem),)
  CONFIGURE_ARGS+= --enable-sysvsem=shared
else
  CONFIGURE_ARGS+= --disable-sysvsem
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-dba),)
  CONFIGURE_ARGS+= --enable-dba=shared
else
  CONFIGURE_ARGS+= --disable-dba
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-sysvshm),)
  CONFIGURE_ARGS+= --enable-sysvshm=shared
else
  CONFIGURE_ARGS+= --disable-sysvshm
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-tokenizer),)
  CONFIGURE_ARGS+= --enable-tokenizer=shared
else
  CONFIGURE_ARGS+= --disable-tokenizer
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-xml),)
  CONFIGURE_ARGS+= --enable-xml=shared,"$(STAGING_DIR)/opt"
  ifneq ($(CONFIG_php81_LIBXML),y)
    CONFIGURE_ARGS+= --with-expat
  endif
else
  CONFIGURE_ARGS+= --disable-xml
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-xmlreader),)
  CONFIGURE_ARGS+= --enable-xmlreader=shared,"$(STAGING_DIR)/opt"
else
  CONFIGURE_ARGS+= --disable-xmlreader
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-xmlwriter),)
  CONFIGURE_ARGS+= --enable-xmlwriter=shared,"$(STAGING_DIR)/opt"
else
  CONFIGURE_ARGS+= --disable-xmlwriter
endif

ifneq ($(SDK)$(CONFIG_PACKAGE_php81-mod-zip),)
  CONFIGURE_ARGS+= --with-zip=shared,"$(STAGING_DIR)/opt"
else
  CONFIGURE_ARGS+= --without-zip
endif

ifneq ($(SDK)$(CONFIG_php81_LIBXML),)
  CONFIGURE_ARGS+= --with-libxml
else
  CONFIGURE_ARGS+= --without-libxml
endif

ifneq ($(CONFIG_php81_SYSTEMTZDATA),)
  CONFIGURE_ARGS+= --with-system-tzdata
else
  CONFIGURE_ARGS+= --without-system-tzdata
endif

ifneq ($(CONFIG_PACKAGE_php81-mod-zend_test),)
  CONFIGURE_ARGS+= --enable-zend-test=shared
else
  CONFIGURE_ARGS+= --disable-zend-test
endif

CONFIGURE_VARS+= \
	ac_cv_c_bigendian_php=$(if $(CONFIG_BIG_ENDIAN),yes,no) \
	php_cv_cc_rpath="yes" \
	iconv_impl_name="gnu_libiconv" \
	ac_cv_php_xml2_config_path="$(STAGING_DIR)/host/bin/xml2-config" \
	ac_cv_u8t_decompose=yes \
	ac_cv_have_pcre2_jit=yes \
	pthreads_working=yes \
	pthreads_checked=yes \
	ac_cv_pthreads_cflags=yes \
	ac_cv_pthreads_lib=yes 
	
TARGET_LDFLAGS += $(if $(CONFIG_USE_GLIBC),-lresolv)

MAKE_VARS+= \
	HOSTCC="$(HOSTCC)"

define Package/php81/conffiles
/opt/etc/php.ini
/opt/etc/php81/
endef

define Package/php81/install
	$(INSTALL_DIR) $(1)/opt/etc
	$(CP) $(PKG_BUILD_DIR)/php.ini-production $(PKG_BUILD_DIR)/php.ini
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/php.ini $(1)/opt/etc
endef

define Package/php81-dev/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(CP) $(PKG_BUILD_DIR)/staging/opt/bin/phpize $(1)/opt/bin/phpize81
	sed -i -e "s#prefix='/opt'#prefix='/opt'#" $(1)/opt/bin/phpize81
	sed -i -e "s#exec_prefix=\"\`eval echo /opt\`\"#exec_prefix='/opt'#" $(1)/opt/bin/phpize81
	sed -i -e "s#/include\`/php\"#/include\`/php81\"#" $(1)/opt/bin/phpize81
	sed -i -e "s#/lib/php\`/build\"#/lib/php81\`/build\"#" $(1)/opt/bin/phpize81
	sed -i -e "s#$(STAGING_DIR_HOST)/bin/sed#/opt/bin/sed#" $(1)/opt/bin/phpize81
	ln -sf phpize81 $(1)/opt/bin/phpize
	$(CP) $(PKG_BUILD_DIR)/staging/opt/bin/php-config $(1)/opt/bin/php81-config
	sed -i -e "s#prefix=\"/opt\"#prefix=\"/opt\"#" $(1)/opt/bin/php81-config
	sed -i -e "s#/include/php\"#/include/php81\"#" $(1)/opt/bin/php81-config
	sed -i -e "s#$(STAGING_DIR_HOST)/bin/sed#/opt/bin/sed#" $(1)/opt/bin/php81-config
	sed -i -e "s#$(STAGING_DIR)/opt/lib#/opt/lib#" $(1)/opt/bin/php81-config
	sed -i -e "s#/opt/lib/php/extensions/no-debug-non-zts-20210902#/opt/lib/php81#" $(1)/opt/bin/php81-config
	ln -sf php81-config $(1)/opt/bin/php-config
	$(INSTALL_DIR) $(1)/opt/include
	$(CP) $(PKG_BUILD_DIR)/staging/opt/include/php $(1)/opt/include/php81
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_BUILD_DIR)/staging/opt/lib/php $(1)/opt/lib/php81
endef

define Package/php81-apache/install
	$(INSTALL_DIR) $(1)/opt/lib/apache2
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libs/libphp.so $(1)/opt/lib/apache2
endef

define Package/php81-cli/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(CP) $(PKG_BUILD_DIR)/sapi/cli/php $(1)/opt/bin/php81-cli
	ln -sf php81-cli $(1)/opt/bin/php-cli
endef

define Package/php81-dbg/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(CP) $(PKG_BUILD_DIR)/sapi/phpdbg/phpdbg $(1)/opt/bin/php81-dbg
	ln -sf php81-dbg $(1)/opt/bin/php-dbg
endef

define Package/php81-litespeed/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(CP) $(PKG_BUILD_DIR)/sapi/litespeed/php $(1)/opt/bin/php81-lsphp
	ln -sf php81-lsphp $(1)/opt/bin/php-lsphp
endef

define Package/php81-embed/install
	$(INSTALL_DIR) $(1)/opt/lib
	$(CP) $(PKG_BUILD_DIR)/libs/libphp.{so,la} $(1)/opt/lib
endef

define Package/php81-cgi/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(CP) $(PKG_BUILD_DIR)/sapi/cgi/php-cgi $(1)/opt/bin/php81-cgi
	ln -sf php81-cgi $(1)/opt/bin/php-cgi
endef

define Package/php81-fastcgi/install
	$(INSTALL_DIR) $(1)/opt/etc/php81
	$(INSTALL_DATA) ./files/php81-fastcgi.conf $(1)/opt/etc/php81/php81-fastcgi
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S79php81-fastcgi $(1)/opt/etc/init.d
	ln -sf S79php81-fastcgi $(1)/opt/etc/init.d/S79php-fastcgi
endef

define Package/php81-fastcgi/conffiles
/opt/etc/php81/php81-fastcgi
endef

define Package/php81-fpm/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/sapi/fpm/php-fpm $(1)/opt/bin/php81-fpm
	$(INSTALL_DIR) $(1)/opt/etc
	$(INSTALL_DATA) ./files/php81-fpm.conf $(1)/opt/etc/php81-fpm.conf
#	$(INSTALL_DIR) $(1)/etc/config
#	$(INSTALL_DATA) ./files/php81-fpm.config $(1)/etc/config/php81-fpm
	$(INSTALL_DIR) $(1)/opt/etc/php81-fpm.d
	$(INSTALL_DATA) ./files/php81-fpm-www.conf $(1)/opt/etc/php81-fpm.d/www.conf
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/S79php81-fpm $(1)/opt/etc/init.d
	ln -sf S79php81-fpm $(1)/opt/etc/init.d/S79php-fpm
endef

define Package/php81-fpm/conffiles
/opt/etc/php81-fpm.conf
/opt/etc/php81-fpm.d/
endef

define Package/php81-mod-openssl/postinst
#!/bin/sh

if [ -e "/opt/etc/php81/20_openssl.ini" ] && [ -e "/opt/etc/php81/15_openssl.ini" ]; then
	echo "Renaming PHP ini file '/opt/etc/php81/20_openssl.ini' -> '/opt/etc/php81/15_openssl.ini'"
	mv /opt/etc/php81/20_openssl.ini /opt/etc/php81/15_openssl.ini
fi
endef

define Package/php81-mod-mysqli/postinst
#!/bin/sh

if [ -e "/opt/etc/php81/20_mysqli.ini" ] && [ -e "/opt/etc/php81/30_mysqli.ini" ]; then
	echo "Renaming PHP ini file '/opt/etc/php81/20_mysqli.ini' -> '/opt/etc/php81/30_mysqli.ini'"
	mv /opt/etc/php81/20_mysqli.ini /opt/etc/php81/30_mysqli.ini
fi
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	$(if $(QUILT),,( cd $(PKG_BUILD_DIR); touch configure.ac; ./buildconf --force ))
endef

define Build/Configure
	$(if $(QUILT),( cd $(PKG_BUILD_DIR); touch configure.ac; ./buildconf --force ))
	$(call Build/Configure/Default)
endef

define Build/InstallDev
	rm -rf $(PKG_BUILD_DIR)/staging
	make -C $(PKG_BUILD_DIR) install INSTALL_ROOT=$(PKG_BUILD_DIR)/staging
	rm -rf $(PKG_BUILD_DIR)/staging/opt/{share,man,sbin}
	rm -f $(PKG_BUILD_DIR)/staging/opt/bin/{php,php-cgi,php-cli}
	$(CP) $(PKG_BUILD_DIR)/staging/opt/bin/phpize $(PKG_BUILD_DIR)/staging/opt/bin/phpize81
	$(CP) $(PKG_BUILD_DIR)/staging/opt/bin/php-config $(PKG_BUILD_DIR)/staging/opt/bin/php81-config
	$(CP) $(PKG_BUILD_DIR)/staging/opt/include/php $(PKG_BUILD_DIR)/staging/opt/include/php81
	$(CP) $(PKG_BUILD_DIR)/staging/opt/lib/php $(PKG_BUILD_DIR)/staging/opt/lib/php81
	$(CP) $(PKG_BUILD_DIR)/staging/opt $(STAGING_DIR)/
	sed -i -e "s#prefix='/opt'#prefix='$(STAGING_DIR)/opt'#" $(STAGING_DIR)/opt/bin/phpize81
	sed -i -e "s#exec_prefix=\"\`eval echo /opt\`\"#exec_prefix='$(STAGING_DIR)/opt'#" $(STAGING_DIR)/opt/bin/phpize81
	sed -i -e "s#/include\`/php\"#/include\`/php81\"#" $(STAGING_DIR)/opt/bin/phpize81
	sed -i -e "s#/lib/php\`/build\"#/lib/php81\`/build\"#" $(STAGING_DIR)/opt/bin/phpize81
	sed -i -e "s#prefix=\"/opt\"#prefix=\"$(STAGING_DIR)/opt\"#" $(STAGING_DIR)/opt/bin/php81-config
	sed -i -e "s#/include/php\"#/include/php81\"#" $(STAGING_DIR)/opt/bin/php81-config
	$(INSTALL_DIR) $(1)/opt//include/php/ext/pdo/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/ext/pdo/php_pdo_driver.h $(1)/opt/include/php/ext/pdo/
	$(INSTALL_DIR) $(1)/opt/include/phpc
	$(INSTALL_DATA) ./files/phpc.h $(1)/opt/include/phpc
endef

define BuildModule
  define Package/php81-mod-$(1)
    $(call Package/php81/Default)
    ifneq ($(3),)
      DEPENDS+=$(3)
    endif
    TITLE:=$(2) shared module
  endef

  define Package/php81-mod-$(1)/install
	$(INSTALL_DIR) $$(1)/opt/lib/php81
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/$(subst -,_,$(1)).so $$(1)/opt/lib/php81/
	$(INSTALL_DIR) $$(1)/opt/etc/php81
      ifeq ($(5),zend)
	echo "zend_extension=/opt/lib/php81/$(subst -,_,$(1)).so" > $$(1)/opt/etc/php81/$(if $(4),$(4),20)_$(subst -,_,$(1)).ini
      else
	echo "extension=$(subst -,_,$(1)).so" > $$(1)/opt/etc/php81/$(if $(4),$(4),20)_$(subst -,_,$(1)).ini
    endif
  endef
  $$(eval $$(call BuildPackage,php81-mod-$(1)))
endef

$(eval $(call BuildPackage,php81))
$(eval $(call BuildPackage,php81-cgi))
$(eval $(call BuildPackage,php81-cli))
$(eval $(call BuildPackage,php81-dbg))
$(eval $(call BuildPackage,php81-dev))
$(eval $(call BuildPackage,php81-embed))
$(eval $(call BuildPackage,php81-fastcgi))
$(eval $(call BuildPackage,php81-fpm))
$(eval $(call BuildPackage,php81-litespeed))
$(eval $(call BuildPackage,php81-apache))

#$(eval $(call BuildModule,NAME,TITLE[,PKG DEPENDS]))
$(eval $(call BuildModule,tidy,TIDY,+PACKAGE_php81-mod-tidy:libtidy))
$(eval $(call BuildModule,enchant,Enchant,+PACKAGE_php81-mod-enchant:libenchant2 +PACKAGE_php81-mod-enchant:libenchant))
$(eval $(call BuildModule,zlib,ZLIB,+PACKAGE_php81-mod-zlib:zlib))
$(eval $(call BuildModule,bz2,BZ2,+PACKAGE_php81-mod-bz2:bzip2))
$(eval $(call BuildModule,pspell,PSPELL,+PACKAGE_php81-mod-pspell:libaspell))
$(eval $(call BuildModule,bcmath,Bcmath))
$(eval $(call BuildModule,calendar,Calendar))
$(eval $(call BuildModule,ctype,Ctype))
$(eval $(call BuildModule,sodium,Sodium,+PACKAGE_php81-mod-sodium:libsodium))
$(eval $(call BuildModule,curl,cURL,+PACKAGE_php81-mod-curl:libcurl))
$(eval $(call BuildModule,dom,DOM,+@php81_LIBXML +PACKAGE_php81-mod-dom:libxml2))
$(eval $(call BuildModule,xsl,XSL,+PACKAGE_php81-mod-xsl:libxslt libexslt))
$(eval $(call BuildModule,dba,DBA))
$(eval $(call BuildModule,exif,EXIF))
$(eval $(call BuildModule,ffi,FFI,+PACKAGE_php81-mod-ffi:libffi))
$(eval $(call BuildModule,fileinfo,Fileinfo))
$(eval $(call BuildModule,filter,Filter))
$(eval $(call BuildModule,ftp,FTP,+PACKAGE_php81-mod-ftp:libopenssl))
$(eval $(call BuildModule,gd,GD graphics,+PACKAGE_php81-mod-gd:libgd-full))
$(eval $(call BuildModule,gettext,Gettext,+PACKAGE_php81-mod-gettext:libintl-full))
$(eval $(call BuildModule,gmp,GMP,+PACKAGE_php81-mod-gmp:libgmp))
$(eval $(call BuildModule,iconv,iConv,$(ICONV_DEPENDS)))
$(eval $(call BuildModule,imap,IMAP,+PACKAGE_php81-mod-imap:libopenssl +PACKAGE_libpam:libpam +PACKAGE_php81-mod-imap:uw-imap))
$(eval $(call BuildModule,intl,Internationalization Functions,+PACKAGE_php81-mod-intl:icu +php81_FULLICUDATA:icu-full-data))
$(eval $(call BuildModule,ldap,LDAP,+PACKAGE_php81-mod-ldap:libopenldap +PACKAGE_php81-mod-ldap:libsasl2))
$(eval $(call BuildModule,mbstring,MBString,+PACKAGE_php81-mod-mbstring:oniguruma))
$(eval $(call BuildModule,mysqli,MySQL Improved Extension,+PACKAGE_php81-mod-mysqli:php81-mod-mysqlnd,30))
$(eval $(call BuildModule,mysqlnd,MySQL Native Driver,+PACKAGE_php81-mod-openssl:php81-mod-openssl))
$(eval $(call BuildModule,opcache,OPcache,,,zend))
$(eval $(call BuildModule,openssl,OpenSSL,+PACKAGE_php81-mod-openssl:libopenssl,15))
$(eval $(call BuildModule,pcntl,PCNTL))
$(eval $(call BuildModule,pdo,PHP Data Objects))
$(eval $(call BuildModule,pdo-mysql,PDO driver for MySQL,+php81-mod-pdo +PACKAGE_php81-mod-pdo-mysql:php81-mod-mysqlnd))
$(eval $(call BuildModule,pdo-dblib,PDO driver for FreeTDS,+php81-mod-pdo +PACKAGE_php81-mod-pdo-dblib:libfreetds))
$(eval $(call BuildModule,pdo-pgsql,PDO driver for PostgreSQL,+php81-mod-pdo +PACKAGE_php81-mod-pdo-pgsql:libpq))
$(eval $(call BuildModule,pdo-sqlite,PDO driver for SQLite 3.x,+php81-mod-pdo +PACKAGE_php81-mod-pdo-sqlite:libsqlite3 +PACKAGE_php81-mod-pdo-sqlite:librt))
$(eval $(call BuildModule,pgsql,PostgreSQL,+PACKAGE_php81-mod-pgsql:libpq))
$(eval $(call BuildModule,phar,Phar Archives))
$(eval $(call BuildModule,session,Session))
$(eval $(call BuildModule,shmop,Shared Memory))
$(eval $(call BuildModule,simplexml,SimpleXML,+@php81_LIBXML +PACKAGE_php81-mod-simplexml:libxml2))
$(eval $(call BuildModule,snmp,SNMP,+PACKAGE_php81-mod-snmp:libnetsnmp +PACKAGE_php81-mod-snmp:libopenssl))
$(eval $(call BuildModule,soap,SOAP,+@php81_LIBXML +PACKAGE_php81-mod-soap:libxml2))
$(eval $(call BuildModule,sockets,Sockets))
$(eval $(call BuildModule,sqlite3,SQLite3,+PACKAGE_php81-mod-sqlite3:libsqlite3))
$(eval $(call BuildModule,sysvmsg,System V messages))
$(eval $(call BuildModule,sysvsem,System V shared memory))
$(eval $(call BuildModule,sysvshm,System V semaphore))
$(eval $(call BuildModule,tokenizer,Tokenizer))
$(eval $(call BuildModule,zend_test,Zend_test))
$(eval $(call BuildModule,xml,XML,+php81_LIBXML:libxml2 +!php81_LIBXML:libexpat))
$(eval $(call BuildModule,xmlreader,XMLReader,+@php81_LIBXML +PACKAGE_php81-mod-dom:php81-mod-dom +PACKAGE_php81-mod-xmlreader:libxml2))
$(eval $(call BuildModule,xmlwriter,XMLWriter,+@php81_LIBXML +PACKAGE_php81-mod-xmlwriter:libxml2))
$(eval $(call BuildModule,zip,ZIP,+PACKAGE_php81-mod-zip:libzip))
