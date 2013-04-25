# Base install

yum install -y curl

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
