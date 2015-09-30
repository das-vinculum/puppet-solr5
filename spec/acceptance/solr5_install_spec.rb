require 'spec_helper_acceptance'

describe 'solr5 class' do

    describe 'running puppet code' do

        it 'should work with no errors' do
        pp = <<-EOS
            class { 'solr5': }
        EOS

        apply_manifest(pp, :catch_failures => true)
        expect( apply_manifest(pp, :catch_failures => true).exit_code).to be_zero
        end
    end
end
