require_relative '../../../lib/tax_calculator/file_reader'

RSpec.describe TaxCalculator::FileReader do
  subject(:reader) { described_class.new(file_path) }

  describe "#list_products" do
    let(:file_path) { './input_test.md' }
    let(:expected) do
      [
        { quantity: 2, product_name: 'book', price: 12.49 },
        { quantity: 1, product_name: 'music CD', price: 14.99 },
        { quantity: 1, product_name: 'chocolate bar', price: 0.85 }
      ]
    end

    it 'must show an array of products' do
      expect(reader.list_products).to eq(expected)
    end
  end
end
