module TaxCalculator
  class Printer
    def initialize(data)
      @data = data
    end

    def print
      <<~EOF
      #{print_products}
      Sales Taxes: #{format_currency_value(data[:taxes])}
      Total: #{format_currency_value(data[:total])}
      EOF
    end

    private

    attr_reader :data

    def print_products
      data[:products].map do |product|
        "#{product[:quantity]} #{product[:name]}: #{format_currency_value(product[:price_with_taxes])}"
      end.flatten.join("\n")
    end

    def format_currency_value(value)
      "%.2f" % value
    end
  end
end
