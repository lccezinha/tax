require_relative './product'
require_relative './tax_applier'

module TaxCalculator
  class Calculator

    # The tax_applier is set as the default TaxApplier, but I decide pass it as a dependency
    # to make it flexible to receive another tax_applier rules if need to change it.
    def initialize(products_list, tax_applier = TaxApplier)
      @products = products_list.map { |data| Product.new(data) }
      @result = { products: [], taxes: 0.0, total: 0.0 }
      @tax_applier = tax_applier
    end

    def calculate
      products.map do |product|
        product_taxes = tax_applier.new(product).apply

        item = {
          quantity: product.quantity,
          name: product.name,
          price_with_taxes: (product.sub_total + product_taxes),
        }

        result[:products].push(item)
        result[:taxes] += product_taxes
        result[:total] += item[:price_with_taxes]
      end

      result
    end

    private

    attr_reader :products, :result, :tax_applier
  end
end
