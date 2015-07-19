require_relative '../lib/parser.rb'

describe Billski::Parser do
  let(:valid_bill) do
    File.open('spec/sample_data/valid_bill_1.txt').read
  end

  describe '.parse' do
    context 'with empty valid content returned' do
      let(:resource) { '{}' }
      it 'returns a hash' do
        expect(described_class.parse(resource)).to be_a Hash
      end
    end

    context 'with empty invalid content returned' do
      let(:resource) { '' }
      it 'raises an exception' do
        expect { described_class.parse(resource) }
          .to raise_error JSON::ParserError
      end
    end

    context 'when parsing a valid bill' do
      it 'returns a hash' do
        expect(described_class.parse(valid_bill)).to be_a Hash
      end
    end
  end
end
