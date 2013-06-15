basebox
=======

Veewee definitions for vagrant VirtualBox and VMware Fusion baseboxes. 
These are the vagrant baseboxes I use for my own personal projents.  These
basebox definitions are heavily customized to be "Don't Repeat Yourself" (DRY) 
modular baseboxes, per [Tim Dysinger](https://github.com/dysinger/basebox).
This project is run against a private Jenkins instance, and as Veewee basebox
definitions are added and/or updated, links to the generated images are
added below:

Current VMware Fusion Baseboxes
===============================

* [misheska-centos-6.4](https://www.dropbox.com/s/z939ia4kurfuw6h/misheska-centos-6.4.box) - CentOS 6.4 64-bit VMware Fusion basebox (VMware Tools 9.2.2.18018)
* [misheska-centos-5.9](https://www.dropbox.com/s/j9y298amevw7sfh/misheska-centos-5.9.box) - CentOS 5.9 64-bit VMware Fusion basebox (VMware Tools 9.2.2.18018)
* [misheska-ubuntu-12.04](https://www.dropbox.com/s/z2pa3qvrgyl77k1/misheska-ubuntu-12.04.box) - Ubuntu 12.04.2 server 64-bit VMware Fusion (VMware Tools, Chef 11.4.4-1 Client)
* [misheska-ubuntu-10.04](https://www.dropbox.com/s/1rl14o3u3b8y5ea/misheska-ubuntu-10.04.box) - Ubuntu 10.04.4 server 64-bit VMware Fusion basebox (VMware Tools 9.2.2.18018)

Current VirtualBox Baseboxes
============================

* [misheska-centos-6.4](https://www.dropbox.com/s/y42egyh9cqsge24/misheska-centos-6.4.box) - CentOS 6.4 64-bit VirtualBox basebox (VirtualBox 4.2.12 Guest Additions)
* [misheska-centos-5.9](https://www.dropbox.com/s/5wpk5mhy3ovs0av/misheska-centos-5.9.box) - CentOS 5.9 64-bit VirtualBox basebox (VirtualBox 4.2.12 Guest Additions)
* [misheska-ubuntu-12.04](https://www.dropbox.com/s/dauh3gn69dp1bfq/misheska-ubuntu-10.04.box) - Ubuntu 12.04.2 server 64-bit VirtualBox basebox (VirtualBox 4.2.12 Guest Additions)
* [misheska-ubuntu-10.04](https://www.dropbox.com/s/m47nubjupedduvh/misheska-ubuntu-12.04.box) - Ubuntu 10.04.4 server 64-bit VirtualBox basebox (VirtualBox 4.2.12 Guest Additions)

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
    # Choose a definition, like 'misheska-ubuntu-12.04'
    rake build[misheska-ubuntu-12.04,vbox]
    rake package[misheska-ubuntu-12.04,vbox]
    rake destroy[misheska-ubuntu-12.04,vbox] 

To build a VMware Fusion box:

    rake list
    # Choose a definition, like 'misheska-centos-6.4'
    rake build[misheska-centos-6.4,fusion]
    rake package[misheska-centos-6.4,fusion]
    rake destroy[misheska-centos-6.4,fusion]

To add a new veewee basebox definition, run the following:

    rake templates
    # Choose a template, like 'Debian-7.0-rc1-amd64-netboot'
    rake define[misheska-debian-7.0,Debian-7.0-rc1-amd64-netboot]
