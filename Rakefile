desc "vewee build[name,provider]"
task :build, [:name, :provider] => [:clone_veewee] do |t, args|
  args.with_defaults(:provider => 'vbox')
  provider = args[:provider]
  name = args[:name]
  veewee_path = "../veewee"
  workdir=Dir.pwd
  Dir.chdir(veewee_path) do
    sh "bundle exec veewee #{provider} build #{name} --workdir=#{workdir}"
  end
end

desc "veewee list"
task :list, [:provider] => [:clone_veewee] do |t, args|
  args.with_defaults(:provider => 'vbox')
  provider = args[:provider]
  veewee_path = "../veewee"
  workdir=Dir.pwd
  Dir.chdir(veewee_path) do
    sh "bundle exec veewee #{provider} list --workdir=#{workdir}"
  end
end

desc "veewee templates"
task :templates, [:provider] do |t, args|
  args.with_defaults(:provider => 'vbox')
  provider = args[:provider]
  veewee_path = "../veewee"
  workdir=Dir.pwd
  Dir.chdir(veewee_path) do
    sh "bundle exec veewee #{provider} templates --workdir=#{workdir}"
  end
end

desc "veewee help"
task :help, [:provider] do |t, args|
  args.with_defaults(:provider => 'vbox')
  provider = args[:provider]
  veewee_path = "../veewee"
  workdir=Dir.pwd
  Dir.chdir(veewee_path) do
    sh "bundle exec veewee #{provider} help --workdir=#{workdir}"
  end
end

desc "veewee define"
task :define, [:name, :template, :provider] do |t, args|
  args.with_defaults(:provider => 'vbox')
  name = args[:name]
  template = args[:template]
  provider = args[:provider]
  veewee_path = "../veewee"
  workdir=Dir.pwd
  Dir.chdir(veewee_path) do
    sh "bundle exec veewee #{provider} define #{name} #{template} --workdir=#{workdir}"
  end
end

desc "vewee package[name,provider]"
task :package, [:name, :provider] do |t, args|
  args.with_defaults(:provider => 'vbox')
  provider = args[:provider]
  name = args[:name]
  if provider == 'fusion'
    vdiskmanager_path = '/Applications/VMware\ Fusion.app/Contents/Library/vmware-vdiskmanager'
    vm_path = '~/Documents/Virtual\ Machines.localized'
    vmwarevm_path = "#{vm_path}/#{name}.vmwarevm"
    vmrun_path = '/Applications/VMware\ Fusion.app/Contents/Library/vmrun'
    vmx_path = "#{vmwarevm_path}/#{name}.vmx"
   
    sh "#{vmrun_path} -T fusion -u root -p vagrant stop #{vmx_path} soft" 
    sh "#{vdiskmanager_path} -d #{vmwarevm_path}/#{name}.vmdk"
    sh "#{vdiskmanager_path} -k #{vmwarevm_path}/#{name}.vmdk"
    sh "mkdir -p output/fusion"
    sh "tar -cvz --exclude='./vmware.log' --exclude='*.lck' --exclude='*.plist' -f output/fusion/#{name}.box -C template metadata.json -C #{vmwarevm_path} ."
  elsif provider == 'vbox'
    sh "mkdir -p output"
    sh "vagrant package --base #{name} --output output/#{name}.box"
  end
end 

desc "vewee destroy[name,provider]"
task :destroy, [:name, :provider] do |t, args|
  args.with_defaults(:provider => 'vbox')
  provider = args[:provider]
  name = args[:name]
  veewee_path = "../veewee"
  workdir=Dir.pwd
  Dir.chdir(veewee_path) do
    sh "bundle exec veewee #{provider} destroy #{name} --workdir=#{workdir}"
  end
end

desc 'create directory for build output'
directory 'output'

desc 'clone veewee'
task :clone_veewee do
  if !File.directory?("../veewee")
    sh 'git clone https://github.com/jedi4ever/veewee.git ../veewee'
    sh 'cd ../veewee && gem install bundler'
    sh 'cd ../veewee && bundle install'
  end
end
