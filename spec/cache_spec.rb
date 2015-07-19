require_relative '../lib/cache.rb'
require_relative './spec_helper'

describe Billski::Cache do
  before(:each) { described_class.init }

  describe '.init' do
    context 'when no class or instance parameter is provided' do
      it 'sets the provider to HashCache.new by default' do
        expect(described_class.provider).to be_a Billski::HashCache
      end
    end
    context 'when a class paramater is provided' do
      it 'sets the provider to an instance of that class' do
        described_class.init(Object)
        expect(described_class.provider).to be_a Object
      end
    end
    context 'when class instance paramater is provided' do
      it 'sets the provider to an instance of that class' do
        described_class.init(o = Object.new)
        expect(described_class.provider).to eq o
      end
    end
  end

  let(:uri) { FULL_URI }
  let(:response) { 'response' }

  describe '.cached?' do
    let(:not_cached_uri) { 'www.different.com' }
    context 'when a url has been cached' do
      before(:each) { described_class.cache(uri, response) }
      it 'returns true' do
        expect(described_class.cached?(uri)).to eq true
      end
    end
    context 'when a url has not been cached' do
      before(:each) { described_class.cache(uri, response) }
      it 'returns true' do
        expect(described_class.cached?(not_cached_uri)).to eq false
      end
    end
  end

  describe '.cache' do
    context 'when a passed a url and data' do
      let(:provider) { double('Billski::HashCache') }
      it 'calls cache on the provider' do
        described_class.init(provider)
        expect(provider).to receive(:cache).with(uri, response)
        described_class.cache(uri, response)
      end

      it 'returns the cached object' do
        described_class.init
        expect(described_class.cache(uri, response)).to eq response
      end
    end
  end

  describe '.get' do
    before(:each) { described_class.cache(uri, response) }
    context 'when a uri has been cached' do
      it 'returns the cached resource' do
        expect(described_class.get(uri)).to eq response
      end
    end
  end
end
