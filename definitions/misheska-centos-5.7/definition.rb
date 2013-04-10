require File.dirname(__FILE__) + "/../.vbox/session.rb"

iso = "CentOS-5.7-x86_64-bin-DVD-1of2.iso"

session =
  VBOX_SESSION.merge({ :iso_file => iso,
                       :iso_md5 => "5db3d49ba7a2c56810822914fadc1edf",
                       :iso_src => "http://vault.centos.org/5.7/isos/x86_64/#{iso}" })

Veewee::Session.declare session
