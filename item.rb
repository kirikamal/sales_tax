class Item
  attr_reader :name, :quantity,:is_imported, :taxes, :price

  SALES_TAX_RATE = 0.10
  IMPORT_TAX_RATE = 0.05
  NEAREST_5_CENT = 1 / 0.05

  BOOKS = 'book'
  CHOCOLATE = 'chocolate'
  PILLS = 'pills'

  def initialize name, quantity, price, is_imported
    @name = name
    @quantity = quantity
    @is_imported = is_imported
    @taxes = calculate_tax price
    @price = total_price price, @taxes
  end

  def total_price price, taxes
    ((@quantity * price) + taxes).round(2)
  end

  def calculate_tax price
    total_taxes = 0
    exempted_items = [BOOKS, CHOCOLATE, PILLS]

    if !exempted_items.any? { |item| @name.include?(item) }
      total_taxes += price * SALES_TAX_RATE
    end

    if @is_imported
      total_taxes += (price * IMPORT_TAX_RATE)
    end

    total_taxes = total_taxes * @quantity

    round_up total_taxes
  end

  def round_up tax
    tax_amount = ((tax * NEAREST_5_CENT).ceil / NEAREST_5_CENT)
  end
end
