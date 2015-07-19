require 'forwardable'

module Billski

  # A wrapper around the cache provided to allow the cache mechanism to be
  # swapped out as required. In this instance the cache is a simple Hash
  # by default, however this pattern makes it possible to change the
  # implementation e.g. to use a KV cache such as Redis
  class Cache
    @provider = nil

    class << self
      extend Forwardable
      attr_reader :provider

      def_delegators :@provider,
                     :cache,
                     :cached?,
                     :get,
                     :clear

      def init(provider = HashCache.new)
        @provider = (provider.class == Class ? provider.new : provider)
      end
    end
  end

  # Hash based implementation of a cache
  class HashCache
    def initialize
      @cache = {}
    end

    def cached?(url)
      @cache.key?(url)
    end

    def clear
      @cache = {}
    end

    def get(url)
      @cache[url]
    end

    def cache(url, response)
      @cache[url] = response
    end
  end
end
