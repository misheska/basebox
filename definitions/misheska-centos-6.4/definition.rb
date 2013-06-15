require File.dirname(__FILE__) + "/../.centos/session.rb"

iso = "CentOS-6.4-x86_64-bin-DVD1.iso"

session =
  CENTOS_SESSION.merge({
    :memory_size => '512',
    :iso_file => iso,
    :iso_md5 => "0128cfc7c86072b13ee80dd013e0e5d7",
    :iso_src => "http://mirrors.kernel.org/centos/6.4/isos/x86_64/#{iso}"
  })

Veewee::Session.declare session
