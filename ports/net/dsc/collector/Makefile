# $OpenBSD$

COMMENT    = DNS Statistics Collector (collector)
VERSION    = 201203250530
DISTNAME   = dsc-${VERSION}
PKGNAME    = dsc-collector-${VERSION}
CATEGORIES = net

MASTER_SITES = http://dns.measurement-factory.com/tools/dsc/download/
HOMEPAGE     = http://dns.measurement-factory.com/tools/dsc/index.html

MAINTAINER = Patrik Lundin <patrik@sigterm.se>

# BSD 2-Clause
PERMIT_PACKAGE_CDROM = Yes

WRKSRC= ${WRKDIR}/${DISTNAME}/collector

# We need to rebuild the configure script before running it.
post-patch:
	@cd ${WRKSRC}/dsc && \
            ln -sf configure.scan configure.ac && \
	    AUTOCONF_VERSION=2.62 autoconf

# collector/cron/upload-prep.pl requires Proc::PID::File
BUILD_DEPENDS = devel/autoconf/2.62 \
                devel/p5-Proc-PID-File
RUN_DEPENDS   = devel/p5-Proc-PID-File

WANTLIB += c m pcap stdc++

.include <bsd.port.mk>
