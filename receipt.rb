require_relative './item_parser'

class Receipt
  attr_reader :items_list

  def initialize
    @items_list = []
  end

  def add_item item
    @items_list << ItemParser.parse_item(item)
  end

  def total_sales_tax
    count = 0
    total_taxes = 0

    while count < @items_list.length
      total_taxes += @items_list[count].taxes
      count += 1
    end

    total_taxes.round(2)
  end

  def total_amount
    count = 0
    total_cost = 0

    while count < @items_list.length
      total_cost += @items_list[count].price
      count += 1
    end

    total_cost.round(2)
  end
end