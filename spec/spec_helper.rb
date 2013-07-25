require 'rspec-puppet'

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

RSpec.configure do |c|
  c.module_path = File.join(fixture_path, 'modules')
  c.manifest_dir = File.join(fixture_path, 'manifests')
end

@oses = {

  'Debian' => {
    :operatingsystem           => 'Debian',
    :osfamily                  => 'Debian',
    :operatingsystemrelease    => '7.0',
    :operatingsystemmajrelease => '7',
    :lsbdistid                 => 'Debian',
    :lsbdistrelease            => '7.0',
    :architecture              => 'amd64',

    :package      => 'autofs',
    :master_cfg   => '/etc/auto.master',
    :service      => 'autofs',
    :prefix_maps  => '/etc',
  },

  'Redhat 5' => {
    :operatingsystem            => 'Redhat',
    :osfamily                   => 'Redhat',
    :operatingsystemrelease     => '5.0',
    :operatingsystemmajrelease  => '5',
    :lsbdistid                  => 'Redhat',
    :lsbdistrelease             => '5.0',
    :architecture               => 'x86_64',

    :package    => 'autofs',
    :master_cfg => '/etc/auto.master',
    :service    => 'autofs',
    :prefix_maps  => '/etc',
  },

  'Redhat 6' => {
    :operatingsystem            => 'Redhat',
    :osfamily                   => 'Redhat',
    :operatingsystemrelease     => '6.0',
    :operatingsystemmajrelease  => '6',
    :lsbdistid                  => 'Redhat',
    :lsbdistrelease             => '6.0',
    :architecture               => 'x86_64',

    :package    => 'autofs',
    :master_cfg => '/etc/auto.master',
    :service    => 'autofs',
    :prefix_maps  => '/etc',
  },

  'CentOS 5' => {
    :operatingsystem            => 'CentOS',
    :osfamily                   => 'Redhat',
    :operatingsystemrelease     => '5.0',
    :operatingsystemmajrelease  => '5',
    :lsbdistid                  => 'CentOS',
    :lsbdistrelease             => '5.0',
    :architecture               => 'x86_64',

    :package    => 'autofs',
    :master_cfg => '/etc/auto.master',
    :service    => 'autofs',
    :prefix_maps  => '/etc',
  },

  'CentOS 6' => {
    :operatingsystem            => 'CentOS',
    :osfamily                   => 'Redhat',
    :operatingsystemrelease     => '6.0',
    :operatingsystemmajrelease  => '6',
    :lsbdistid                  => 'CentOS',
    :lsbdistrelease             => '6.0',
    :architecture               => 'x86_64',

    :package    => 'autofs',
    :master_cfg => '/etc/auto.master',
    :service    => 'autofs',
    :prefix_maps  => '/etc',
  },

}

