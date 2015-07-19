require_relative 'config'
require 'net/http'

module Billski
  class Provider
    # Number of times to rety on a failed request
    attr_accessor :retry_count
    # The delay in s to wait before retrying after a failed request
    attr_accessor :retry_delay

    def initialize #(config)
      @retry_count = 3
      @retry_delay = 1
    end

    # Attempt to read the source_uri specified within the config; if for
    # any reason an exception is thrown the method will sleep for the time
    # in seconds specified by +retry_delay+ and then reattempt +retry_count+
    # times to reread the uri
    def json(uri = Config.source_uri)
      retried = 0
      begin
        return Net::HTTP.get(uri)
      rescue Exception
        sleep @retry_delay
        retry unless (retried += 1) == @retry_count
        raise
      end
    end
  end
end
