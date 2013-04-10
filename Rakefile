desc "veewee list"
task :list do
  veewee_path = "../veewee"
  workdir=Dir.pwd
  Dir.chdir(veewee_path) do
    sh "bundle exec veewee fusion list --workdir=#{workdir}"
  end
end

desc "vewee build[name,provider]"
task :build, :name, :provider do |t, args|
  args.with_defaults(:provider => 'vbox')
  name = args[:name]
  provider = args[:provider]
  veewee_path = "/Users/misheska/git/veewee"
  workdir=Dir.pwd
  Dir.chdir(veewee_path) do
    sh "bundle exec veewee #{provider} build #{name} --workdir=#{workdir}"
  end
end

desc "vewee package[name,provider]"
task :export, :name, :provider do |t, args|
  args.with_defaults(:provider => 'vbox')
  name = args[:name]
  provider = args[:provider]
  if provider == 'fusion'
    vdiskmanager_path = '/Applications/VMware\ Fusion.app/Contents/Library/vmware-vdiskmanager'
    vm_path = '/Users/misheska/Documents/Virtual\ Machines.localized'
    vmwarevm_path = "#{vm_path}/#{name}.vmwarevm"
    
    sh "#{vdiskmanager_path} -d #{vmwarevm_path}/#{name}.vmdk"
    sh "#{vdiskmanager_path} -k #{vmwarevm_path}/#{name}.vmdk"
    sh "tar -cvz --exclude='./vmware.log' --exclude='*.lck' --exclude='*.plist' -f #{name}.box -C template metadata.json -C #{vmwarevm_path} ."
  elsif provider == 'vbox'
    sh "vagrant package --base #{name} --output #{name}.box"
  end
end 

desc "vewee destroy[name,provider]"
task :destroy, :name, :provider do |t, args|
  args.with_defaults(:provider => 'vbox')
  name = args[:name]
  provider = args[:provider]
  veewee_path = "../veewee"
  workdir=Dir.pwd
  Dir.chdir(veewee_path) do
    sh "bundle exec veewee #{provider} destroy #{name} --workdir=#{workdir}"
  end
end

desc 'create directory for build output'
directory 'output'
