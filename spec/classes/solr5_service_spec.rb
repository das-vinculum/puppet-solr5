require 'spec_helper'

describe 'solr5::service', :type => 'class' do

  context 'with manage_service => false' do
    let(:pre_condition) { '  solr5::extract_file { "install_solr_service.sh":
    name             => "install_solr_service.sh",
    path_to_archive  => $package_target_dir,
    archive_filename => $solr_archive_file_name,
    file_to_extract  => "install_solr_service.sh"
  }' }
    let :params do
      {
        :manage_service => false,
        :solr_name => 'my_fancy_solr_name'
      }
    end
    it{
      should compile.with_all_deps
      should contain_class('solr5::service')
      should_not contain_service('my_fancy_solr_name')
    }
  end

  context 'with manage_service => true' do
    let(:pre_condition) { '  solr5::extract_file { "install_solr_service.sh":
    name             => "install_solr_service.sh",
    path_to_archive  => $package_target_dir,
    archive_filename => $solr_archive_file_name,
    file_to_extract  => "install_solr_service.sh"
  }' }
    let(:facts) { {:service_provider => 'systemd'} }
    let :params do
      {
        :manage_service => true,
        :solr_name => 'my_fancy_solr_name'
      }
    end
    it{
      should compile.with_all_deps
      should contain_class('solr5::service')

      should contain_service('my_fancy_solr_name').with(
        {
          'ensure' => 'running',
          'provider' => 'init',
          'enable' => 'true',
          'hasstatus' => 'false',
        })
    }
  end

end
