require_relative '../../../lib/tax_calculator/calculator'

RSpec.describe TaxCalculator::Calculator do
  subject(:calculator) { described_class.new(products_list) }

  describe "#calculate" do
    context "when products list contains products that pay basic taxes" do
      let(:products_list) do
        [
          { quantity: 2, name: 'book', price: 12.49 },
          { quantity: 1, name: 'music CD', price: 14.99 },
          { quantity: 1, name: 'chocolate bar', price: 0.85 }
        ]
      end
      let(:expected) do
        {
          products: [
            { quantity: 2, name: 'book', price_with_taxes: 24.98 },
            { quantity: 1, name: 'music CD', price_with_taxes: 16.49 },
            { quantity: 1, name: 'chocolate bar', price_with_taxes: 0.85 }
          ],
          taxes: 1.5,
          total: 42.32
        }
      end

      it 'given and input of products must calculate the taxes' do
        expect(calculator.calculate).to eq(expected)
      end
    end

    context "when products list contains imported products" do
      let(:products_list) do
        [
          { quantity: 1, name: 'imported box of chocolates', price: 10 },
          { quantity: 1, name: 'imported bottle of perfume', price: 47.5 }
        ]
      end
      let(:expected) do
        {
          products: [
            { quantity: 1, name: 'imported box of chocolates', price_with_taxes: 10.5 },
            { quantity: 1, name: 'imported bottle of perfume', price_with_taxes: 54.65 },
          ],
          taxes: 7.65,
          total: 65.15
        }
      end

      it 'given and input of products must calculate the taxes' do
        expect(calculator.calculate).to eq(expected)
      end
    end
  end
end
