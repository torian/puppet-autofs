
require 'spec_helper'

oses = @oses

describe 'autofs' do

  oses.keys.each do |os|

    describe "Running on #{os}" do

      let(:facts) { {
				:osfamily                  => oses[os][:osfamily],
				:operatingsystem           => oses[os][:operatingsystem],
				:operatingsystemmajrelease => oses[os][:operatingsystemmajrelease],
				:architecture              => oses[os][:architecture],
			} }

      it { should include_class('autofs::params') }
      it { should contain_package(oses[os][:package]) }
      it { should contain_file(oses[os][:master_cfg]) }
      it { should contain_service(oses[os][:service]) }

      context 'Motd disabled (default)' do
        let(:params) { { } }

        it { should_not contain_motd__register('autofs') }
      end

      context 'Motd enabled' do
        let(:params) { {
          :enable_motd => true
        } }

        it { should contain_motd__register('autofs') }
      end

    end

  end

end
