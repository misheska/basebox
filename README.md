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

To add a new veewee basebox definition, run the following:

    bundle exec veewee vbox templates
    # Choose a template, like 'Debian-7.0-rc1-amd64-netboot'
    bundle exec veewee vbox define misheska-debian-7.0 Debian-7.0-rc1-amd64-netboot --workdir=~/basebox

In this drectory, the basebox definitions are heavily customized to be
"Don't Repeat Yourself" (DRY) modular baseboxes, per
[Tim Dysinger](https://github.com/dysinger/basebox).
