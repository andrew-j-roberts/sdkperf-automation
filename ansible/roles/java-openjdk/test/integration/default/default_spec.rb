describe apt('ppa:openjdk-r/ppa') do
  it { should be_exist }
  it { should be_enabled }
end

describe package('openjdk-7-jre-headless') do
  it { should be_installed }
end

describe command('/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java') do
  it { should be_exist }
end

describe command('java') do
  it { should be_exist}
end