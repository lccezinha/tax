module TaxCalculator
  class Calculator
    # Basic sales tax is applicable at a rate of 10% on all goods, except books, food,
    # and medical products that are exempt.
    # Import duty is an additional sales tax applicable on all imported goods at a rate of 5%,
    # with no exemptions.

    # 2 book at 12.49
    # 1 music CD at 14.99
    # 1 chocolate bar at 0.85

    EXEMPT_PRODUCTS = ['book', 'chocolate bar']
    BASIC_TAX_PERCENTAGE = 0.1
    IMPORT_DUTY_TAX_PERCENTAGE = 0.05

    def initialize(products_list)
      @products_list = products_list
      @result = { products: [], taxes: 0.0, total: 0.0 }
    end

    # {
    #   products: [
    #     { quantity: 2, name: 'book', price_with_taxes: 24.98 },
    #     { quantity: 1, name: 'music CD', price_with_taxes: 16.49 },
    #     { quantity: 1, name: 'chocolate bar', price_with_taxes: 0.85 }
    #   ],
    #   taxes: 1.5,
    #   total: 42.32
    # }

    # { quantity: 2, name: 'book', price_with_taxes: 24.98, taxes: 0.0 },
    # { quantity: 1, name: 'music CD', price_with_taxes: 16.49, taxes: 1.5 },
    # { quantity: 1, name: 'chocolate bar', price_with_taxes: 0.85, taxes: 0.0 }

    # { quantity: 2, name: 'book', total_price: 2, taxes: 0.0 }
    def calculate
      taxes = 0.0
      total = 0.0

      products_list.map do |product_line|
        product_sub_total = product_line[:quantity] * product_line[:price]
        product_taxes = EXEMPT_PRODUCTS.include?(product_line[:name]) ? 0.0 : product_sub_total * BASIC_TAX_PERCENTAGE

        product = {
          quantity: product_line[:quantity],
          name: product_line[:name],
          price_with_taxes: (product_sub_total + product_taxes).round(2),
        }

        taxes += product_taxes
        total += product[:price_with_taxes]

        result[:products].push(product)
      end

      result[:taxes] = taxes.round(2)
      result[:total] = total
      result
    end


    private

    attr_reader :products_list, :result
  end
end
