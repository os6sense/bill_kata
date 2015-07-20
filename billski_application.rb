require 'sinatra/base'
require 'sinatra/assetpack'
require 'haml'

require_relative 'lib/bill'

module Billski
  class Application < Sinatra::Base
    register Sinatra::AssetPack

    assets do
      serve '/js', from: 'app/js'
      serve '/bower_components', from: 'bower_components'

      js :libs, %w(/bower_components/jquery/dist/jquery.min.js
                   /bower_components/underscore/underscore-min.js
                   /bower_components/backbone/backbone-min.js
                   /bower_components/sortable/js/sortable.min.js
                   /bower_components/moment/min/moment.min.js)

      css :libs, %w(/bower_components/sortable/css/sortable-theme-minimal.css
                    /bower_components/bootstrap/dist/css/bootstrap.min.css)

      js :application, %w(/js/application.js
                          /js/statement.js
                          /js/package.js
                          /js/total.js
                          /js/call_charges.js
                          /js/skystore.js)

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

    (Fields::FIELDS << 'bill' << 'total').each do |name|
      get "/#{name}/" do
        content_type :json
        halt settings.bill_provider.send(name.to_sym).to_json
      end
    end
  end
end
