
require 'spec_helper'

oses = @oses

indirect_map = {
  :name     => 'indirect',
  :key      => '*',
  :prefix   => '/mnt/home',
  :location => 'nfs.server:/srv/homes/&'
  }

direct_map = {
  :name     => 'direct',
  :key      => '/srv/backup',
  :prefix   => '/-',
  :location => 'nfs.server:/srv/backup'
  }


describe 'autofs::map' do

  oses.keys.each do |os|

    describe "Running on #{os}" do

      let(:facts) { {
				:osfamily                  => oses[os][:osfamily],
				:operatingsystem           => oses[os][:operatingsystem],
				:operatingsystemmajrelease => oses[os][:operatingsystemmajrelease],
				:architecture              => oses[os][:architecture],
			} }

      context 'Fail without Class[autofs]' do

        map = indirect_map

        let(:title)  { map[:name] }
        let(:params) { {
          :key      => map[:key],
          :prefix   => map[:prefix],
          :location => map[:location],
        }}

        it {
          expect { 
            should include_class('autofs::params')
          }.to raise_error(Puppet::Error, /^Could not find resource/)
        } 
      end

      context 'Indirect map' do

        map = indirect_map
        
        let(:pre_condition) { 'include autofs' }

        let(:title)  { map[:name] }
        let(:name)   { map[:name] }
        let(:params) { {
          :key      => map[:key],
          :prefix   => map[:prefix],
          :location => map[:location],
        } }

        it { should include_class('autofs::params') }
        it { should contain_file("#{oses[os][:prefix_maps]}/auto.#{map[:name]}") }
        it { should contain_file_line("auto.master - #{map[:name]}").with( { 
            'path' => oses[os][:master_cfg],
            'line' => "#{map[:prefix]}    #{oses[os][:prefix_maps]}/auto.#{map[:name]}"
          } )
        }

      end

      context 'Direct map' do

        map = direct_map
        
        let(:pre_condition) { 'include autofs' }

        let(:title)  { map[:name] }
        let(:name)   { map[:name] }
        let(:params) { {
          :key      => map[:key],
          :prefix   => map[:prefix],
          :location => map[:location],
        } }

        it { should include_class('autofs::params') }
        it { should contain_file("#{oses[os][:prefix_maps]}/auto.#{map[:name]}") }
        it { should contain_file_line("auto.master - #{map[:name]}").with( { 
            'path' => oses[os][:master_cfg],
            'line' => "#{map[:prefix]}    #{oses[os][:prefix_maps]}/auto.#{map[:name]}"
          } )
        }

      end

    end

  end

end
