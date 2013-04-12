require File.dirname(__FILE__) + "/../.centos/session.rb"

CENTOS_FUSION_SESSION =
  CENTOS_SESSION.merge({  :os_type_id => 'Centos_64',
                          :postinstall_files => ["vmware-tools.sh",
                                                 "vagrant.sh", 
                                                 "chef-client.sh",
                                                 "cleanup.sh",
                                                 "cleanup-fusion.sh",
                                                 "minimize.sh"] })
