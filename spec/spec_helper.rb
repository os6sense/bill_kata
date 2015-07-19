require 'webmock/rspec'
require_relative 'shared_helpers.rb'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, HOST_RE)
      .with(headers: { 'Accept': '*/*', 'User-Agent': 'Ruby' })
      .to_return(status: 200, body: VALID_BILL, headers: {})
  end
end

