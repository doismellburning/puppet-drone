require 'spec_helper'

describe 'drone::install' do
  describe 'drone::install class on RedHat' do
    let(:facts) {{
      :osfamily => 'RedHat',
    }}

    it { should contain_package('foo') }
  end

  describe 'drone::install class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it { should contain_package('foo') }
  end
end
