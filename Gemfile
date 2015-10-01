source 'https://rubygems.org'
ruby '1.9.3', :patchlevel => '551'
puppetversion = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 3.3']
gem 'metadata-json-lint'
gem 'rake', '~> 10.4.2'
gem 'puppet', '3.8.3'
gem 'puppet-lint', '>= 1.0.0'
gem 'puppetlabs_spec_helper'
gem 'facter', '>= 1.7.0'
gem 'beaker'
gem 'beaker-rspec', :require => false
gem 'pry'
gem 'serverspec', :require => false
gem 'fog-google', '0.1.0'
if RUBY_VERSION >= '1.8.7' and RUBY_VERSION < '1.9'
  gem 'rspec', '~> 2.0'
end
