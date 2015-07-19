require 'uri'

module Billski
  # Simple configuration provider
  class Config
    @source_uri = URI 'http://safe-plains-5453.herokuapp.com/bill.json'

    class << self
      attr_reader :source_uri
    end
  end
end
