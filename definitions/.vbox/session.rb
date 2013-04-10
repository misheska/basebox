require File.dirname(__FILE__) + "/../.centos/session.rb"

VBOX_SESSION =
  CENTOS_SESSION.merge({  :os_type_id => 'RedHat_64',
                          :postinstall_files => ["guest-additions.sh",
                                                 "vagrant.sh",
                                                 "chef-client.sh",
                                                 "vagrant.sh",
                                                 "cleanup.sh",
                                                 "cleanup-vbox.sh",
                                                 "minimize.sh"] })
