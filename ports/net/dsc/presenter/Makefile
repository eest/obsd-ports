# $OpenBSD$

COMMENT    = DNS Statistics Collector (presenter)
VERSION    = 201203250530
DISTNAME   = dsc-${VERSION}
PKGNAME    = dsc-presenter-${VERSION}
CATEGORIES = net

MASTER_SITES = http://dns.measurement-factory.com/tools/dsc/download/
HOMEPAGE     = http://dns.measurement-factory.com/tools/dsc/index.html

MAINTAINER = Patrik Lundin <patrik@sigterm.se>

# BSD 2-Clause
PERMIT_PACKAGE_CDROM = Yes

WRKSRC= ${WRKDIR}/${DISTNAME}/presenter

BUILD_DEPENDS = www/p5-CGI-Untaint \
                sysutils/p5-File-Flock \
                sysutils/p5-File-NFSLock \
                devel/p5-Hash-Merge \
                net/p5-IP-Country \
                math/p5-Math-Calc-Units \
                net/p5-Net-DNS \
                textproc/p5-Text-Template \
                www/p5-URI \
                textproc/p5-XML-Simple

RUN_DEPENDS   = ${BUILD_DEPENDS} \
                devel/p5-Switch

.include <bsd.port.mk>
