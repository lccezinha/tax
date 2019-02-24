module TaxCalculator
  class Product
    def initialize(data)
      @data = data
    end

    def name
      data[:name]
    end

    def quantity
      data[:quantity]
    end

    def price
      data[:price]
    end

    def imported?
      data[:name].include?('imported')
    end

    def category
      return :books if data[:name].include?('book')
      return :food if data[:name].include?('chocolate')
      return :medical if data[:name].include?('pills')
      :other
    end

    def sub_total
      data[:price] * data[:quantity]
    end

    private

    attr_reader :data
  end
end
