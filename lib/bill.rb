require_relative './cache.rb'
require_relative './provider.rb'
require_relative './parser.rb'
require_relative './config.rb'

module Billski
  module Fields
    FIELDS = %w(statement package call_charges sky_store)

    FIELDS.each do |method_name|
      field_name = method_name

      # fields are present on the bill as pascalCase hence map our snake_case
      # method names to pascalCase
      field_name = method_name.split('_').each_with_index.map do |e, i|
        i > 0 ? e.capitalize : e
      end.join if method_name.index('_')

      define_method(method_name.to_sym) { bill[field_name] }
    end
  end

  # Gets the bill from the server and provides a number of accessor methods
  # to retrive individual parts of the bill. Its possible some parts,
  # callCharges in particular, might be quite large and hence would slow
  # loading of the bill. This may also be true of rentals and buyAndKeep.
  class Bill
    include Fields

    def initialize(provider: Provider.new, cache: Cache)
      @provider, @cache = provider, cache
      @cache.init
    end

    def bill(uri = Config.source_uri)
      return @cache.get(uri) if @cache.cached?(uri)
      @cache.cache(uri, Parser.parse(@provider.json(uri)))
    end

    # ugly but total is not wrapped when provided by the server
    def total
      {total: bill['total'].to_s}
    end
  end
end
