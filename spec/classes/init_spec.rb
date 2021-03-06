require 'spec_helper'

describe 'drone' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "drone class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should contain_class('drone::params') }

        it { should contain_class('drone::install') }
        it { should contain_class('drone::config') }
        it { should contain_class('drone::service') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'drone class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
