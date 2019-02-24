module TaxCalculator
  class TaxApplier
    EXEMPT_CATEGORIES = %i[books food medical]
    BASIC_TAX_PERCENTAGE = 0.1
    IMPORTED_DUTY_TAX_PERCENTAGE = 0.05

    private_constant :EXEMPT_CATEGORIES, :BASIC_TAX_PERCENTAGE, :IMPORTED_DUTY_TAX_PERCENTAGE

    def initialize(product)
      @product = product
    end

    def apply
      calculate_not_exempt_taxes + calculate_imported_taxes
    end

    private

    def calculate_not_exempt_taxes
      EXEMPT_CATEGORIES.include?(product.category) ? 0.0 : (product.sub_total * BASIC_TAX_PERCENTAGE)
    end

    def calculate_imported_taxes
      product.imported? ? (product.sub_total * IMPORTED_DUTY_TAX_PERCENTAGE) : 0.0
    end

    attr_reader :product
  end
end
