require 'spec_helper'

describe 'drone::service' do
  describe 'drone::service class on RedHat' do
    let(:facts) {{
      :osfamily => 'RedHat',
    }}

    it { should contain_service('foo') }
  end

  describe 'drone::service class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it { should contain_service('foo') }
  end
end

