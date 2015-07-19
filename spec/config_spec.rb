require 'spec_helper'
require_relative '../lib/config.rb'

describe Billski::Config do
  subject(:config) { described_class }

  describe '#source_uri' do
    it 'returns a URI' do
      expect(config.source_uri).to be_a URI
    end
  end
end
