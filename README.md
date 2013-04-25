basebox
=======

Veewee definitions for vagrant VirtualBox and VMware Fusion baseboxes. 
These are the vagrant baseboxes I use for my own personal projents.  These
basebox definitions are heavily customized to be "Don't Repeat Yourself" (DRY) 
modular baseboxes, per [Tim Dysinger](https://github.com/dysinger/basebox).
This project is run against a private Jenkins instance, and as Veewee basebox
definitions are added and/or updated, links to the generated images are
added below:

Current Baseboxes
=================

* [misheska-centos-6.4-fusion](https://www.dropbox.com/s/9oe0vdl9nh2fvzm/misheska-centos-6.4-fusion.box) - CentOS 6.4 64-bit Minimal VMware Fusion (VMware Tools, Chef 11.4.4-1 Client)
* [misheska-centos-5.7-fusion](https://www.dropbox.com/s/7r97w23ou6amgk5/misheska-centos-5.7-fusion.box) - CentOS 5.7 64-bit VMware Fusion (VMware Tools, Chef 11.4.4-1 Client)
* [misheska-ubuntu-12.04-fusion](https://www.dropbox.com/s/zr1hktxfuzhtl5z/misheska-ubuntu-12.04-fusion.box) - Ubuntu 12.04.2 server 64-bit VMware Fusion (VMware Tools, Chef 11.4.4-1 Client)
* [misheska-ubuntu-10.04-fusion](https://www.dropbox.com/s/pj1p7guhi3q0k73/misheska-ubuntu-10.04-fusion.box) - Ubuntu 10.04.4 server 64-bit VMware Fusion (VMware Tools, Chef 11.4.4-1 Client)

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
