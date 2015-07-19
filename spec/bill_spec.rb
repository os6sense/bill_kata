require_relative '../lib/bill.rb'
require_relative './webmock_helper.rb'

require 'json'

describe Billski::Bill do
  subject { described_class.new }

  let(:valid_bill) do
    JSON.parse(File.open('spec/sample_data/valid_bill_1.txt').read)
  end

  describe '#bill' do
    context 'when called without any parameters' do
      it 'returns the bill from the default URI' do
        expect(subject.bill).to eq valid_bill
      end
    end

    it 'caches the bill after the first call' do
      cache = instance_double('Cache', init: '', cache: nil, get: nil)
      allow(cache).to receive(:cached?).and_return(false, true)
      subject = described_class.new(cache: cache)

      2.times { subject.bill }

      expect(cache).to have_received(:cache)
      expect(cache).to have_received(:cached?).twice
      expect(cache).to have_received(:get)
    end
  end

  describe '#statement' do
    it 'returns the statement section of the bill' do
      expect(subject.statement).to eq valid_bill['statement']
    end
  end

  describe '#total' do
    it 'returns the total section of the bill' do
      expect(subject.total).to eq valid_bill['total']
    end
  end

  describe '#package' do
    it 'returns the package section of the bill' do
      expect(subject.package).to eq valid_bill['package']
    end
  end

  describe '#call_charges' do
    it 'returns the callCharges section of the bill' do
      expect(subject.call_charges).to eq valid_bill['callCharges']
    end
  end

  describe '#sky_store' do
    it 'returns the callCharges section of the bill' do
      expect(subject.sky_store).to eq valid_bill['skyStore']
    end
  end
end
