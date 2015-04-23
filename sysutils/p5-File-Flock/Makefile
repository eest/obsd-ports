# $OpenBSD$

COMMENT = file locking with flock

DISTNAME   = File-Flock-2013.11
CATEGORIES = sysutils

# Perl
PERMIT_PACKAGE_CDROM = Yes

MODULES = cpan

BUILD_DEPENDS = devel/p5-File-Slurp \
                devel/p5-Test-SharedFork

RUN_DEPENDS   = devel/p5-AnyEvent \
                devel/p5-Data-Structure-Util \
                devel/p5-IO-Event

.include <bsd.port.mk>
