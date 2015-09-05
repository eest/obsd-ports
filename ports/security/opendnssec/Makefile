# $OpenBSD$

SHARED_ONLY=	Yes

COMMENT=	open-source turn-key solution for DNSSEC

DISTNAME=	opendnssec-1.4.7

CATEGORIES=	security

HOMEPAGE=	http://www.opendnssec.org/

MAINTAINER=	Patrik Lundin <patrik@sigterm.se>

# BSD
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += c crypto iconv ldns m pthread xml2 z

MASTER_SITES=	http://dist.opendnssec.org/source/

LIB_DEPENDS=	net/ldns/libldns \
		textproc/libxml

TEST_DEPENDS=	security/softhsm

MODULES=	converters/libiconv

FAKE_FLAGS=	sysconfdir=${PREFIX}/share/examples/opendnssec

CONFIGURE_STYLE= gnu
CONFIGURE_ARGS+= --disable-pedantic

FLAVORS=	sqlite3 mariadb
FLAVOR?=	sqlite3

WANTLIB+=	lzma

.if ${FLAVOR:Msqlite3}
WANTLIB+=	sqlite3
.endif

.if ${FLAVOR:Mmariadb}
CONFIGURE_ARGS+= --with-database-backend=mysql
WANTLIB+=	mysqlclient_r ssl stdc++
LIB_DEPENDS+=	databases/mariadb
.endif

.if ${FLAVOR:Msqlite3} && ${FLAVOR:Mmariadb}
ERRORS+= "Fatal: mutually exclusive flavors: ${FLAVORS}"
.endif

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/opendnssec
	cd ${WRKSRC}; \
	${INSTALL_DATA} LICENSE ${PREFIX}/share/doc/opendnssec; \
	${INSTALL_DATA} plugins/simple-dnskey-mailer/simple-dnskey-mailer.sh \
			${PREFIX}/share/opendnssec

.include <bsd.port.mk>
