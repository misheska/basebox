basebox
=======

Veewee definitions for VirtualBox and VMware Fusion baseboxes

Currently the vewee gem hasn't yet been updated to support vagrant 1.x, so
instead install veewee from source.  In another directory tree outside this
Git repository, run the following:

    git clone https://github.com/jedi4ever/veewee.git ~/veewee
    cd ~/veewee
    gem install bundler
    bundle install

To run veewee commands, make sure you set the `--workdir` parameter to point
at this git repository:

    bundle exec veewee list --workdir ~/basebox

To add a new veewee VirtualBox basebox definition, run the following:

    bundle exec veewee vbox templates
    # Choose a template, like 'Debian-7.0-rc1-amd64-netboot'
    bundle exec veewee vbox define misheska-debian-7.0 Debian-7.0-rc1-amd64-netboot --workdir=~/basebox

To add a new veewee VMware Fusion basebox definition:

    bundle exec veewee fusion templates
    # Choose a template, like 'Debian-7.0-rc1-amd64-netboot'
    bundle exec veewee fusion define misheska-debian-7.0-fusion Debian-7.0-rc1-amd64-netboot --workdir=~/basebox

In this drectory, the basebox definitions are heavily customized to be
"Don't Repeat Yourself" (DRY) modular baseboxes, per
[Tim Dysinger](https://github.com/dysinger/basebox).

To build a VirtualBox box:

    bundle exec veewee vbox list --workdir=/Users/misheska/git/basebox
    # Choose a definition, like 'misheska-centos-5.7' 
    bundle exec veewee vbox build misheska-centos-5.7 --workdir=/Users/misheska/git/basebox
    pushd /Users/misheska/git/basebox
    mkdir -p boxes
    vagrant package --base 'misheska-centos-5.7' --output 'boxes/misheska-centos-5.7.box'
    popd
    bundle exec veewee vbox destroy misheska-centos-5.7 --workdir=/Users/misheska/git/basebox

To build a VMware Fusion box:

    bundle exec veewee fusion list --workdir=/Users/misheska/git/basebox
    # Choose a definition, like 'misheska-centos-5.7-fusion'
    bundle exec veewee fusion build misheska-centos-5.7-fusion --workdir=/Users/misheska/git/basebox
    pushd /Users/misheska/git/basebox
    mkdir -p boxes
    # There's no `vagrant package` for Fusion yet, do it by hand
    shutdown the VM
    # Defragment main disk
    /Applications/VMware\ Fusion.app/Contents/Library/vmware-vdiskmanager -d /Users/misheska/Documents/Virtual\ Machines.localized/misheska-centos-5.7-fusion/misheska-centos-5.7-fusion.vmdk
    # Compress main disk
    /Applications/VMware\ Fusion.app/Contents/Library/vmware-vdiskmanager -k /Users/misheska/Documents/Virtual\ Machines.localized/misheska-centos-5.7-fusion/misheska-centos-5.7-fusion.vmdk
    pushd /Users/misheska/Documents/Virtual\ Machines.localized/misheska-centos-5.7-fusion.vmwarevm
    rm *.plist
    rm vmware.log
    rm -rf *.lck
    cat <<EOF > metadata.json
    {
      "provider": "vmware_fusion"
    }
    EOF
    tar cvzf /Users/misheska/git/boxes/basebox/misheska-centos-5.7-fusion.box ./*
    bundle exec veewee fusion destroy misheska-centos-5.7-fusion --workdir=/Users/misheska/git/basebox
