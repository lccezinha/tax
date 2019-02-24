# TaxCalculator

Welcome to the TaxCalculator.

This whole structure was built to calculate the product and its taxes based on the product category.

The structure is composed of the following classes:

- `Calculator`: The class that is responsible to loop through all products all return the result with applied taxes.
- `FileReader`: The class that is responsible to read the input files and format the result in a proper way to be used in the calculator class.
- `Printer`: The class that is responsible to receive the data and print it out on the screen.
- `Product`: The class that is responsible to map the data to a product.
- `TaxApplier`: The class that receives a product and apply the taxes on its values.

# How to use it?

Access the project folder and run the command:

```
ruby lib/tax_calculator.rb

Products with taxes for list: ./input_1.md:

2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32

---

Products with taxes for list: ./input_2.md:

1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.62
Sales Taxes: 7.62
Total: 65.12

---

Products with taxes for list: ./input_3.md:

1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 box of imported chocolates: 35.44
Sales Taxes: 7.78
Total: 98.26

---
```
