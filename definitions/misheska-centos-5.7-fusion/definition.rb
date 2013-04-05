require File.dirname(__FILE__) + "/../.centos/session-fusion.rb"

iso = "CentOS-5.7-x86_64-netinstall.iso"

session =
  CENTOS_SESSION_FUSION.merge({ :iso_file => iso,
                         :iso_md5 => "5db3d49ba7a2c56810822914fadc1edf",
                         :iso_src => "http://vault.centos.org/5.7/isos/x86_64/#{iso}" })

Veewee::Session.declare session
