require_relative '../../../lib/tax_calculator/product'

RSpec.describe TaxCalculator::Product do
  subject(:product) { described_class.new(data) }

  describe "attributes" do
    let(:data) do
      { quantity: 1, name: 'imported box of chocolates', price: 10 }
    end

    it { expect(product.name).to eq(data[:name]) }
    it { expect(product.quantity).to eq(data[:quantity]) }
    it { expect(product.price).to eq(data[:price]) }
  end

  describe "#imported?" do
    context "when product name contain word imported" do
      let(:data) do
        { quantity: 1, name: 'imported box of chocolates', price: 10 }
      end

      it { expect(product.imported?).to be_truthy }
    end

    context "when product name does not contain word imported" do
      let(:data) do
        { quantity: 1, name: 'box of chocolates', price: 10 }
      end

      it { expect(product.imported?).to be_falsey }
    end
  end

  describe "#category" do
    context 'when product in a book' do
      let(:data) do
        { quantity: 1, name: 'imported books', price: 10 }
      end

      it { expect(product.category).to eq(:books) }
    end

    context 'when product in a food' do
      let(:data) do
        { quantity: 1, name: 'chocolates bar', price: 10 }
      end

      it { expect(product.category).to eq(:food) }
    end

    context 'when product in a medical' do
      let(:data) do
        { quantity: 1, name: 'some pills', price: 10 }
      end

      it { expect(product.category).to eq(:medical) }
    end

    context 'when product in a anything else' do
      let(:data) do
        { quantity: 1, name: 'foobar', price: 10 }
      end

      it { expect(product.category).to eq(:other) }
    end
  end

  describe "#sub_total" do
    let(:data) do
      { quantity: 2, name: 'foobar', price: 10.5 }
    end

    it { expect(product.sub_total).to eq(21) }
  end
end
