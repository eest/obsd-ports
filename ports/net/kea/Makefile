# $OpenBSD$

COMMENT=	KEA DHCP server

VERSION=	0.9.2

DISTNAME=	kea-${VERSION}

CATEGORIES=	net

MASTER_SITES=	${MASTER_SITE_ISC:=kea/${VERSION}/}

HOMEPAGE=	http://kea.isc.org/

MAINTAINER=	Patrik Lundin <patrik@sigterm.se>

CONFIGURE_STYLE=	gnu

BUILD_DEPENDS=	devel/boost

LIB_DEPENDS=	devel/log4cplus

# ISC
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += c crypto log4cplus m pthread stdc++

SHARED_LIBS +=  kea-asiodns               0.0 # 0.0
SHARED_LIBS +=  kea-asiolink              0.0 # 2.0
SHARED_LIBS +=  kea-cc                    0.0 # 1.0
SHARED_LIBS +=  kea-cfgclient             0.0 # 2.0
SHARED_LIBS +=  kea-cryptolink            0.0 # 1.0
SHARED_LIBS +=  kea-dhcp++                0.0 # 3.0
SHARED_LIBS +=  kea-dhcp_ddns             0.0 # 1.0
SHARED_LIBS +=  kea-dhcpsrv               0.0 # 4.0
SHARED_LIBS +=  kea-dns++                 0.0 # 2.0
SHARED_LIBS +=  kea-exceptions            0.0 # 0.0
SHARED_LIBS +=  kea-hooks                 0.0 # 1.0
SHARED_LIBS +=  kea-log                   0.0 # 1.0
SHARED_LIBS +=  kea-stats                 0.0 # 1.0
SHARED_LIBS +=  kea-threads               0.0 # 0.0
SHARED_LIBS +=  kea-util-io               0.0 # 0.0
SHARED_LIBS +=  kea-util                  0.0 # 1.0

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/kea
	${INSTALL_DATA} ${WRKSRC}/src/bin/keactrl/kea.conf ${PREFIX}/share/examples/kea
	${INSTALL_DATA} ${WRKSRC}/src/bin/keactrl/keactrl.conf ${PREFIX}/share/examples/kea

.include <bsd.port.mk>
