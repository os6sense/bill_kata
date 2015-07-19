require './billski_application.rb'

map '/v1' do
  # provide - cache class
  # config


  run Billski::Application
end
