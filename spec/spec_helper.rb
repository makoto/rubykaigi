# -*- coding: utf-8 -*-
require 'rubygems'
require 'spork'
# --- Instructions ---
# - Sort through your spec_helper file. Place as much environment loading
#   code that you don't normally modify during development in the
#   Spork.prefork block.
# - Place the rest under Spork.each_run block
# - Any code that is left outside of the blocks will be ran during preforking
#   and during each_run!
# - These instructions should self-destruct in 10 seconds.  If they don't,
#   feel free to delete them.
#
#Spork.prefork do
  # Loading more in this block will cause your specs to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path(File.join(File.dirname(__FILE__),'..','config','environment'))
  require 'spec/autorun'
  require 'spec/rails'

  # Uncomment the next line to use webrat's matchers
  #require 'webrat/integrations/rspec-rails'

  # Requires supporting files with custom matchers and macros, etc,
  # in ./support/ and its subdirectories.
  Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].
    delete_if {|dirname| dirname =~ /blueprints(?:\/|\.rb)/}.each {|f| require f}
  # machinistのデータは毎回読み直したいのでここでは飛ばしている


  Spec::Runner.configure do |config|
    # If you're not using ActiveRecord you should remove these
    # lines, delete config/database.yml and disable :active_record
    # in your config/boot.rb
    config.use_transactional_fixtures = true
    config.use_instantiated_fixtures  = false
    config.fixture_path = RAILS_ROOT + '/spec/fixtures/'

    # == Fixtures
    #
    # You can declare fixtures for each example_group like this:
    #   describe "...." do
    #     fixtures :table_a, :table_b
    #
    # Alternatively, if you prefer to declare them only once, you can
    # do so right here. Just uncomment the next line and replace the fixture
    # names with your fixtures.
    #
    config.global_fixtures = :ruby_kaigis
    #
    # If you declare global fixtures, be aware that they will be declared
    # for all of your examples, even those that don't use them.
    #
    # You can also declare which fixtures to use (for example fixtures for test/fixtures):
    #
    config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
    #
    # == Mock Framework
    #
    # RSpec uses its own mocking framework by default. If you prefer to
    # use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    config.mock_with :rr
    #
    # == Notes
    #
    # For more information take a look at Spec::Runner::Configuration and Spec::Runner
    config.include WardenHelperMethods

    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation, { :except => %w[ruby_kaigis] }
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:all) do
      Sham.reset(:before_all)
    end

    config.before(:each) do
      DatabaseCleaner.start
      Sham.reset(:before_each)

      begin
        Redis::Objects.redis.flushdb
      rescue Errno::ECONNREFUSED
        # Redis doesn't running.
      end
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end
  end
#end

#Spork.each_run do
  # This code will be run each time you run your specs.
  support_base_dir = File.expand_path(File.join(File.dirname(__FILE__),'support'))
  require File.join(support_base_dir, 'blueprints.rb')
  Dir[File.join(support_base_dir, 'blueprints', '**','*.rb')].each {|f| require f}
#end
