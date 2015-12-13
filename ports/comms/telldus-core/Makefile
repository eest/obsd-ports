# $OpenBSD$

SHARED_ONLY =		Yes

COMMENT =		driver and tools for controlling a Telldus TellStick

DISTNAME =		telldus-core-2.1.2

SHARED_LIBS =		telldus-core	0.0 # 2.1

CATEGORIES =		comms

HOMEPAGE =		http://www.telldus.com/products/tellstick

MAINTAINER =		Patrik Lundin <patrik@sigterm.se>

# LGPL
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += c confuse ftdi iconv m pthread stdc++

MASTER_SITES =		http://download.telldus.se/TellStick/Software/telldus-core/

# Dependencies
#
MODULES =		devel/cmake
#BUILD_DEPENDS =	???
#RUN_DEPENDS =		???
LIB_DEPENDS =		devel/argp-standalone \
			devel/libconfuse \
			devel/libftdi \
			converters/libiconv
#TEST_DEPENDS =		???

#MAKE_FLAGS =		???
#MAKE_ENV =		???
#FAKE_FLAGS =		???
#TEST_FLAGS =		???

.include <bsd.port.mk>
