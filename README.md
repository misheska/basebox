basebox
=======

Veewee definitions for vagrant VirtualBox and VMware Fusion baseboxes. 
These are the vagrant baseboxes I use for my own personal projents.  These
basebox definitions are heavily customized to be "Don't Repeat Yourself" (DRY) 
modular baseboxes, per [Tim Dysinger](https://github.com/dysinger/basebox).
This project is run against a private Jenkins instance, and as Veewee basebox
definitions are added and/or updated, links to the generated images are
added below:

Current Basesboxes
==================

* [misheska-centos-6.4-fusion](https://www.dropbox.com/s/9oe0vdl9nh2fvzm/misheska-centos-6.4-fusion.box) - CentOS 6.4 64-bit Minimal VMware Fusion (VMware Tools, Chef 11.4.4-1 Client)
* [misheska-centos-5.7-fusion](https://www.dropbox.com/s/7r97w23ou6amgk5/misheska-centos-5.7-fusion.box) - CentOS 5.7 64-bit VMware Fusion (VMware Tools, Chef 11.4.4-1 Client)

Getting Started
===============

Currently the vewee gem hasn't yet been updated to support vagrant 1.x, so
instead the included Rakefile automatically installs veewee from source
alongside this project.  To use, clone this repository and make sure that
the rake gem is installed:

    $ gem install rake
    $ git clone git://github.com/misheska/basebox.git
    $ cd basebox

To build a VirtualBox box:

    rake list
    # Choose a definition, like 'misheska-centos-5.7'
    rake build[misheska-centos-5.7,vbox]
    rake package[misheska-centos-5.7,vbox]
    rake destroy[misheska-centos-5.7,vbox] 

To build a VMware Fusion box:

    rake list
    # Choose a definition, like 'misheska-centos-6.4-fusion'
    rake build[misheska-centos-6.4-fusion,fusion]
    rake package[misheska-centos-6.4-fusion,fusion]
    rake destroy[misheska-centos-6.4-fusion,fusion]

To add a new veewee VirtualBox basebox definition, run the following:

    bundle exec veewee vbox templates
    # Choose a template, like 'Debian-7.0-rc1-amd64-netboot'
    bundle exec veewee vbox define misheska-debian-7.0 Debian-7.0-rc1-amd64-netboot --workdir=../basebox

To add a new veewee VMware Fusion basebox definition:

    bundle exec veewee fusion templates
    # Choose a template, like 'Debian-7.0-rc1-amd64-netboot'
    bundle exec veewee fusion define misheska-debian-7.0-fusion Debian-7.0-rc1-amd64-netboot --workdir=../basebox

