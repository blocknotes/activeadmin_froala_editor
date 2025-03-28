# frozen_string_literal: true

source 'https://rubygems.org'

if ENV['DEVEL'] == '1'
  rails_ver = ENV.fetch('RAILS_VERSION')
  gem 'rails', rails_ver

  gem 'activeadmin', ENV.fetch('ACTIVEADMIN_VERSION')
  gem 'activeadmin_froala_editor', path: './'
  gem 'appraisal', '~> 2.4'

  if rails_ver.start_with?('7.0')
    gem 'concurrent-ruby', '1.3.4'
    gem 'sqlite3', '~> 1.4'
  else
    gem 'sqlite3'
  end
else
  gemspec
end

gem 'bigdecimal'
gem 'mutex_m'
gem 'puma'
gem 'sassc'
gem 'sprockets-rails'

# Testing
gem 'capybara'
gem 'cuprite'
gem 'rspec_junit_formatter'
gem 'rspec-rails'

# Linters
gem 'fasterer'
gem 'rubocop'
gem 'rubocop-packaging'
gem 'rubocop-performance'
gem 'rubocop-rails'
gem 'rubocop-rspec'

# Tools
gem 'pry-rails'
