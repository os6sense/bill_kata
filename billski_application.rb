require 'sinatra/base'
require_relative 'lib/bill'

module Billski
  class Application < Sinatra::Base
    configure do
      set :bill_provider, Bill.new
    end

    get '/' do
      halt 'ph'
    end

    (Fields::FIELDS << 'bill').each do |name|
      get "/#{name}/" do
        content_type :json
        halt settings.bill_provider.send(name.to_sym).to_json
      end
    end
  end
end
