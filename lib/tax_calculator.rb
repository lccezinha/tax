require_relative "tax_calculator/version"
require_relative "tax_calculator/file_reader"
require_relative "tax_calculator/calculator"
require_relative "tax_calculator/printer"

module TaxCalculator
  def self.run
    ['./input_1.md'].each do |file_path|
      products = FileReader.new(file_path).list_products
      calculated_result = Calculator.new(products).calculate
      puts Printer.new(calculated_result).print
    end
  end
end

TaxCalculator.run
