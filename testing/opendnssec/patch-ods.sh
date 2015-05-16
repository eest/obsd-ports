#!/bin/sh

# This script cleans up all opendnssec related files from the system and
# prints instructions on how to add patches.

# Perform cleanup if opendnssec is currently installed
if [ -d /var/opendnssec ]; then
    pkill ods-
    sleep 3
    pkg_delete opendnssec
    rm -rf /etc/opendnssec
    rm -rf /var/opendnssec
    rm -rf /var/run/opendnssec
    /usr/sbin/userdel _opendnssec
    /usr/sbin/groupdel _opendnssec
fi

# Remove everything from the build
cd /usr/ports/security/opendnssec
make clean=all

echo
echo "=== to extract the source:"
echo "cd /usr/ports/security/opendnssec"
echo "make extract"

echo
echo "=== to modify a file:"
echo "cd \`make show=WRKSRC\`"
echo "cp file-to-edit.c file-to-edit.c.orig"
echo "<edit file-to-edit.c>"
echo
echo "=== to generate a patch from the change:"
echo "cd /usr/ports/security/opendnssec"
echo "make update-patches"
echo "<press enter at prompt and quit the edior that opens>"
echo "<a patch now exists in the patches/ directory>"
echo
echo "=== to clean everything and build/install the package again (will be used by ods-reset.sh):"
echo "make clean=all"
echo "make install"
echo
