# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in kaminari.gemspec
gemspec

if ENV['RAILS_VERSION'] == 'edge'
  gem 'railties', git: 'https://github.com/rails/rails.git'
  gem 'activerecord', git: 'https://github.com/rails/rails.git', require: 'active_record'
  gem 'actionview', git: 'https://github.com/rails/rails.git', require: 'action_view'
elsif ENV['RAILS_VERSION'] == '5.2'
  gem 'railties', git: 'https://github.com/rails/rails.git', branch: '5-2-stable'
  gem 'activerecord', git: 'https://github.com/rails/rails.git', require: 'active_record', branch: '5-2-stable'
  gem 'actionview', git: 'https://github.com/rails/rails.git', require: 'action_view', branch: '5-2-stable'
elsif ENV['RAILS_VERSION']
  gem 'railties', "~> #{ENV['RAILS_VERSION']}.0"
  gem 'activerecord', "~> #{ENV['RAILS_VERSION']}.0", require: 'active_record'
  gem 'actionview', "~> #{ENV['RAILS_VERSION']}.0", require: 'action_view'
else
  gem 'rails'
end

gem 'selenium-webdriver'

rails_version = ENV['RAILS_VERSION'] || '∞'

platforms :ruby do
  gem 'sqlite3', rails_version >= '5.1' ? '>= 1.4' : '< 1.4', require: false
  gem 'pg', rails_version >= '5.1' ? '>= 1.0.0' : '< 1.0.0', require: false
  gem 'mysql2', rails_version >= '4.2' ? '>= 0.4' : '< 0.4', require: false
end

platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter', require: false
  gem 'activerecord-jdbcpostgresql-adapter', require: false
  gem 'activerecord-jdbcmysql-adapter', require: false
end

if RUBY_ENGINE == 'rbx'
  platforms :rbx do
    gem 'rubysl', '~> 2.0'
    gem 'racc'
    gem 'minitest'
    gem 'rubinius-developer_tools'
  end
end
