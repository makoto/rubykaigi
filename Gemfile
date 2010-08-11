# -*- coding: utf-8 -*-
source :rubygems
source 'http://gems.github.com'

gem 'rails', '2.3.8', :require => nil
gem 'mysql'
gem 'configatron'
gem "ambethia-smtp-tls", :require => "smtp-tls"
gem "fastercsv"
gem "hoptoad_notifier"
gem 'i18n_generators', :git => 'git://github.com/amatsuda/i18n_generators.git'
gem 'haml'
gem 'fastercsv'
gem 'whenever', '0.4.2'
gem 'delayed_job'
gem 'rack-google-analytics', '0.6.1'
gem 'will_paginate'
gem 'redis-objects', :require => 'redis/objects'
gem 'SystemTimer'
gem 'twitter'

gem 'rails_warden'
gem 'pusher'
gem 'warden_oauth'
gem 'warden-openid'

gem 'god'

group :development do
  gem 'capistrano', :require => nil
  gem 'capistrano-ext', :require => nil
  gem 'capistrano-notification', '0.0.2', :require => nil
  gem 'gettext', '<2' # required by i18n_generators
  gem 'thin'
end

group :test, :cucumber do
  gem 'rspec-rails'
  gem 'rr'
  gem 'machinist', :require => 'machinist/active_record'
  gem 'faker'
  gem 'email_spec'
  gem 'autotest-rails'
#  gem 'autotest-growl'
  gem 'daemons'
  gem 'spork'
  gem 'cucumber-rails'
  gem 'webrat'
  gem 'moro-miso'
  gem 'database_cleaner'
  gem 'nokogiri'
  gem 'steak', :require => nil
  gem 'capybara'
end
