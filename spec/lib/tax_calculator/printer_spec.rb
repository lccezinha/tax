require_relative '../../../lib/tax_calculator/printer'

RSpec.describe TaxCalculator::Printer do
  subject(:printer) { described_class.new(data) }

  describe ".print" do
    let(:data) do
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
    let(:expected) do
      <<~EOF
      2 book: 24.98
      1 music CD: 16.49
      1 chocolate bar: 0.85
      Sales Taxes: 1.50
      Total: 42.32
      EOF
    end

    it 'must format and print the output result' do
      expect(printer.print).to eq(expected)
    end
  end
end
