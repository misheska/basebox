# Apt-install various things necessary for Ruby, guest additions,
# etc., and remove optional things to trim down the machine.
apt-get -y update
apt-get -y upgrade
apt-get clean

apt-get -y install curl

# Set up sudo - be careful to set the file attribute before copying to sudoers.d
( cat <<'EOP'
%veewee ALL=NOPASSWD:ALL
EOP
) > /tmp/veewee
chmod 0440 /tmp/veewee
mv /tmp/veewee /etc/sudoers.d/
