module TaxCalculator
  class FileReader
    def initialize(file_path)
      @file_path = file_path
    end

    def list_products
      read_file_lines
    end

    private

    attr_reader :file_path

    QUANTITY_REGEX = /^\d+/.freeze
    PRICE_REGEX = /[0-9]{1,}.[0-9]{1,}$/.freeze

    private_constant :QUANTITY_REGEX, :PRICE_REGEX

    def read_file_lines
      result = []
      File.foreach(file_path) { |line| result.push(transform_line_in_hash(line)) }
      result
    end

    def transform_line_in_hash(line)
      {
        quantity: line.scan(QUANTITY_REGEX).first.to_i,
        product_name: line.gsub(QUANTITY_REGEX, '').gsub(PRICE_REGEX, '').strip.gsub(/at$/, '').strip,
        price: line.scan(PRICE_REGEX).first.to_f
      }
    end
  end
end
