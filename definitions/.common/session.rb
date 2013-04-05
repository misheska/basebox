COMMON_SESSION = {
  :cpu_count => '1', :memory_size => '384',
  :disk_size => '40960', :disk_format => 'VDI', :hostiocache => 'off',
  :iso_download_timeout => 1000,
  :boot_wait => "10",
  :kickstart_port => "7122", :kickstart_timeout => 10000,
  :ssh_login_timeout => "10000", :ssh_user => "vagrant", :ssh_password => "vagrant", :ssh_key => "",
  :ssh_host_port => "7222", :ssh_guest_port => "22",
  :sudo_cmd => "echo '%p'|sudo -S sh '%f'",
  :postinstall_timeout => "10000",
  :virtualbox => {
    :vm_options => {
      :ioapi => "on",
      :pae => "on"
    }
  }
}
