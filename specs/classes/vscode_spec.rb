require 'spec_helper'
describe 'vscode', :type => :class do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

    it { is_expected.to compile }
    it { is_expected.to compile.with_all_deps }

    it { is_expected.to contain_class('vscode') }

    context 'vscode::install defaults' do
      it { is_expected.to contain_package('code') }
    end
  end
end
