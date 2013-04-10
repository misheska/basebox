require File.dirname(__FILE__) + "/../.centos/session.rb"

FUSION_SESSION =
  CENTOS_SESSION.merge({  :os_type_id => 'Centos_64',
                          :postinstall_files => ["vmware-tools.sh",
                                                 "vagrant.sh", 
                                                 "chef-client.sh",
                                                 "cleanup.sh",
                                                 "cleanup-fusion.sh",
                                                 "minimize.sh"] })
