require_relative './receipt'
require_relative './print_receipt'

class EntryPoint
  def sale_item
    receipt = Receipt.new

    while item = gets.chomp do
      case item
      when ""
        puts "All items entered"
        break
      else
        receipt.add_item item
      end
    end

    puts '==============='
    puts PrintReceipt.format_receipt receipt
    puts '==============='
  end
end

EntryPoint.new.sale_item