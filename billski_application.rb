require 'sinatra/base'
require 'sinatra/assetpack'
require 'haml'

require_relative 'lib/bill'

module Billski
  class Application < Sinatra::Base
    register Sinatra::AssetPack

    assets do
      js :application, ['/js/*.js']
      css :application, ['/css/*.css']

      js_compression :jsmin
      css_compression :sass
    end

    configure do
      set :bill_provider, Bill.new
      enable :logging
    end

    get '/' do
      haml :index
    end

    (Fields::FIELDS << 'bill').each do |name|
      get "/#{name}/" do
        content_type :json
        halt settings.bill_provider.send(name.to_sym).to_json
      end
    end
  end
end
