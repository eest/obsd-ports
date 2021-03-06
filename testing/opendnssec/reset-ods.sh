#!/bin/sh

# To get the most out of this script, make sure to build the port with
# debug symbols:
# echo 'DEBUG=-g' > /etc/mk.conf

# This script automates the initial setup steps for the opendnssec port and
# print instructions on how to cause a crash on the i386 arch. If opendnssec is
# installed it will be reinstalled in a clean state.

script_dir=`dirname $0`

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

# Install the package
cd /usr/ports/security/opendnssec
make install
cd -

# Configure softhsm
echo "0:/var/opendnssec/softhsm/slot0.db" > /etc/softhsm.conf

# Initialize softhsm
softhsm --init-token --slot 0 --label OpenDNSSEC --so-pin 1234 --pin 1234
chown _opendnssec /var/opendnssec/softhsm/slot0.db

# Bootstrap OpenDNSSEC
echo y | ods-ksmutil setup
echo
/etc/rc.d/opendnssec start

# Add the unsigned zone file
cp ${script_dir}/example.com /var/opendnssec/unsigned/

# Crank up the verbosity
ods-signer verbosity 9

# List the currently running processes:
echo
ps auxww | grep ods-

# The last steps are left manual
echo
echo "=== to crash ods-signerd run:"
echo "ods-ksmutil zone add --zone example.com --policy default"
echo "ods-control enforcer notify"

echo
echo "=== to get a core dump after it has crashed do this:"
echo "chpass -s /bin/sh _opendnssec"
echo "su _opendnssec"
echo "/usr/local/sbin/ods-signerd -c /etc/opendnssec/conf.xml -d"
echo "ls -l /var/opendnssec/tmp/"
echo
