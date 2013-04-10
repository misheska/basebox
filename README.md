basebox
=======

Veewee definitions for VirtualBox and VMware Fusion baseboxes

Currently the vewee gem hasn't yet been updated to support vagrant 1.x, so
instead install veewee from source.  In another directory tree, preferably
alongside this Git repository, run the following:

    cd ..
    git clone https://github.com/jedi4ever/veewee.git
    cd veewee
    gem install bundler
    bundle install

To run veewee commands, make sure you set the `--workdir` parameter to point
at this git repository with the basebox definitions:

    bundle exec veewee list --workdir ../basebox

To add a new veewee VirtualBox basebox definition, run the following:

    bundle exec veewee vbox templates
    # Choose a template, like 'Debian-7.0-rc1-amd64-netboot'
    bundle exec veewee vbox define misheska-debian-7.0 Debian-7.0-rc1-amd64-netboot --workdir=../basebox

To add a new veewee VMware Fusion basebox definition:

    bundle exec veewee fusion templates
    # Choose a template, like 'Debian-7.0-rc1-amd64-netboot'
    bundle exec veewee fusion define misheska-debian-7.0-fusion Debian-7.0-rc1-amd64-netboot --workdir=../basebox

In this drectory, the basebox definitions are heavily customized to be
"Don't Repeat Yourself" (DRY) modular baseboxes, per
[Tim Dysinger](https://github.com/dysinger/basebox).

To build a VirtualBox box:

    rake list
    # Choose a definition, like 'misheska-centos-5.7'
    rake build[misheska-centos-5.7,vbox]
    rake package[misheska-centos-5.7,vbox]
    rake destroy[misheska-centos-5.7,vbox] 

To build a VMware Fusion box:

    rake list
    # Choose a definition, like 'misheska-centos-5.7-fusion'
    rake build[misheska-centos-5.7-fusion,fusion]
    rake package[misheska-centos-5.7-fusion,fusion]
    rake destroy[misheska-centos-5.7-fusion,fusion]
