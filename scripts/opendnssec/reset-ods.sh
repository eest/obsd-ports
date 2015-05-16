#!/bin/sh

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

# Initialize softhsm
softhsm --init-token --slot 0 --label OpenDNSSEC --so-pin 1234 --pin 1234
chown _opendnssec /var/opendnssec/softhsm/slot0.db

# Bootstrap OpenDNSSEC
echo y | ods-ksmutil setup
echo
/etc/rc.d/opendnssec start

# Add the unsigned zone file
cp /root/example.com /var/opendnssec/unsigned/

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
