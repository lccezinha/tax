require_relative './product'
require_relative './tax_applier'

module TaxCalculator
  class Calculator
    def initialize(products_list)
      @products = products_list.map { |data| Product.new(data) }
      @result = { products: [], taxes: 0.0, total: 0.0 }
    end

    def calculate
      taxes = 0.0
      total = 0.0

      products.map do |product|
        taxes = TaxApplier.new(product).apply

        item = {
          quantity: product.quantity,
          name: product.name,
          price_with_taxes: (product.sub_total + taxes),
        }

        result[:products].push(item)
        result[:taxes] += taxes
        result[:total] += item[:price_with_taxes]
      end

      result
    end

    private

    attr_reader :products, :result
  end
end
