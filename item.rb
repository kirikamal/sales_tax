class Item
  attr_reader :name, :quantity,:is_imported, :taxes, :price

  SALES_TAX_RATE = 0.10
  IMPORT_TAX_RATE = 0.05
  NEAREST_CENT = 1 / 0.05

  def initialize name, quantity, price, is_imported
    @name = name
    @quantity = quantity
    @is_imported = is_imported
    @taxes = calculate_tax(price)
    @price = total_price(price, @taxes)
  end

  def total_price price, taxes
    ((@quantity * price) + taxes).round(2)
  end

  def calculate_tax(price)
    total_taxes = 0
    exempted_items = ['books', 'chocolate', 'pills']

    if exempted_items.any? { |item| @name.include?(item) }
      total_taxes += price * SALES_TAX_RATE
    end

    if @is_imported
      total_taxes += (price * IMPORT_TAX_RATE)
    end

    round_up total_taxes
  end

  def round_up amount
    tax_amount = ((amount * 1 / NEAREST_CENT).ceil / NEAREST_CENT)
  end
end