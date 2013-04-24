require File.dirname(__FILE__) + "/../.centos/session.rb"

iso = "CentOS-6.4-x86_64-minimal.iso"

session =
  CENTOS_SESSION.merge({
    :memory_size => '512',
    :iso_file => iso,
    :iso_md5 => "4a5fa01c81cc300f4729136e28ebe600",
    :iso_src => "http://yum.singlehop.com/CentOS/6.4/isos/x86_64/#{iso}"
  })

Veewee::Session.declare session
