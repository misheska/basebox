# Base install

# update root certs
#wget -O/etc/pki/tls/certs/ca-bundle.crt http://curl.haxx.se/ca/cacert.pem
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
