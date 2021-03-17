class PrintReceipt

  def self.format_receipt receipt
    count = 0
    output = ''

    while count < receipt.items_list.length
      output += "#{receipt.items_list[count].quantity} #{receipt.items_list[count].name}: #{'%.02f' % receipt.items_list[count].price}\n"
      count += 1
    end

    output + "\nSales Taxes: #{'%.02f' % receipt.total_sales_tax}\nTotal: #{'%.02f' % receipt.total_amount}"
  end

end