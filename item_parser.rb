require_relative './item'
require 'byebug'

class ItemParser
  IMPORTED = 'imported'

  def self.parse_item item
    item_contents = item.split(',')

    quantity = item_contents[0].to_i
    name = item_contents[1].strip!
    price = item_contents[2].strip.to_f
    is_imported = item.include? IMPORTED

    Item.new name, quantity, price, is_imported
  end

end