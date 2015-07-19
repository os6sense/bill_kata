require_relative '../lib/provider.rb'
require_relative '../lib/config.rb'

require_relative 'webmock_helper'

describe Billski::Provider do
  let(:config) do
    class_double('Billski::Config', source_uri: URI(FULL_URI))
  end

  subject { described_class.new }

  describe '#initialize' do
    it { is_expected.to be_a described_class }
  end

  describe '#retry_delay' do
    it 'defaults to 1 (s)' do
      expect(subject.retry_delay).to eq 1
    end

    it 'allows a delay to be set between retries' do
      subject.retry_delay = 5
      expect(subject.retry_delay).to eq 5
    end
  end

  describe '#retry_count' do
    it 'defaults to 3' do
      expect(subject.retry_count).to eq 3
    end

    it 'allows a the number of attempts to retry to be set' do
      subject.retry_count = 5
      expect(subject.retry_count).to eq 5
    end
  end

  describe '#json' do
    before(:each) { subject.retry_delay = 0.1 }

    context 'when the resource is available' do
      #it 'reads sends a source_uri message to the config' do
        #Config = double("Config")
        #expect(Config).to receive(:source_uri)
        #subject.json
      #end

      it 'returns json response from the configured uri' do
        expect(subject.json).to eq VALID_BILL
      end
    end

    context 'when the resource/network is unavailable' do
      before(:each) { stub_request(:get, HOST_RE).to_timeout }
      before(:each) { subject.retry_count = 4 }

      it 'raise a Timeout::Error' do
        expect { subject.json }.to raise_exception Timeout::Error
      end
      it 'retries the number of times specified by #retry_delay' do
        expect { subject.json }.to raise_exception Timeout::Error
        expect(a_request(:any, HOST_RE)).to have_been_made.times(4)
      end
    end
  end
end
