$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'flexibee'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.include WebMock::API

  config.expect_with :rspec do |expectations|
   expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:each) do
    @user_id = 'pecher'
    @login = 'danpecher'
    @password = 'hesloheslo'
    @company = 'esperia_test'

    @flexibee = Flexibee::Client.new(@user_id, @login, @password, @company)
  end
end
