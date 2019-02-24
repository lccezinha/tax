require_relative '../../../lib/tax_calculator/tax_applier'

RSpec.describe TaxCalculator::TaxApplier do
  subject(:applier) { described_class.new(product) }

  describe ".apply" do
    context 'when product in exempt from normal taxes' do
      let(:product) do
        double(
          'product',
          name: 'pills',
          price: 10.0,
          quantity: 1,
          imported?: false,
          category: :medical,
          sub_total: 10.0
        )
      end

      it { expect(applier.apply).to eq(0.0) }
    end

    context 'when product in not exempt receive an increase of 10% in price' do
      let(:product) do
        double(
          'product',
          name: 'pills',
          price: 10.0,
          quantity: 2,
          imported?: false,
          category: :other,
          sub_total: 20.0
        )
      end

      it { expect(applier.apply).to eq(2.00) }
    end

    context 'when product is imported receive an increase of 5% in price' do
      let(:product) do
        double(
          'product',
          name: 'pills',
          price: 10.0,
          quantity: 1,
          imported?: true,
          category: :food,
          sub_total: 10.0
        )
      end

      it { expect(applier.apply).to eq(0.5) }
    end

    context 'when product is not exempt and is imported receive an increase of 15% in price beucase is imported' do
      let(:product) do
        double(
          'product',
          name: 'foobar',
          price: 10.0,
          quantity: 1,
          imported?: true,
          category: :other,
          sub_total: 10.0
        )
      end

      it { expect(applier.apply).to eq(1.5) }
    end
  end
end
