require File.dirname(__FILE__) + "/../.common/session.rb"

CENTOS_SESSION =
  COMMON_SESSION.merge({ :boot_cmd_sequence =>
                         [ '<Tab> text ks=http://%IP%:%PORT%/ks.cfg<Enter>' ],
                         :kickstart_file => "ks.cfg",
                         :os_type_id => 'Centos_64',
                         :postinstall_files => [ "base.sh",
                                                 "chef.sh",
                                                 "vagrant.sh",
                                                 "vmtools.sh",
                                                 "cleanup.sh",
                                                 "zerodisk.sh" ],
                         :shutdown_cmd => "/sbin/halt -h -p" })
