require 'json'

module Billski
  # Converts the
  class Parser
    class << self
      def parse(resource)
        JSON.parse(resource)
      end
    end
  end
end
