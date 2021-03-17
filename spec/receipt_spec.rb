require 'spec_helper'
require_relative '../item'
require_relative '../receipt'

RSpec.describe Receipt do

  it 'should add an item' do
    receipt = Receipt.new
    receipt.add_item('1, chocolate bar, 0.85')
    item = receipt.items_list[0]

    expected_item = Item.new('chocolate bar', 1, 0.85, false)
    expect(item.name).to eq(expected_item.name)
    expect(item.quantity).to be(expected_item.quantity)
    expect(item.price).to be(expected_item.price)
    expect(item.is_imported).to be(expected_item.is_imported)
  end

  it 'should calculate the total amount' do
    receipt = Receipt.new
    receipt.add_item('1, imported bottle of perfume, 27.99')
    receipt.add_item('1, bottle of perfume, 18.99')
    receipt.add_item('1, packet of headache pills, 9.75')
    receipt.add_item('1, box of imported chocolates, 11.25')

    expect(receipt.total_amount).to be(74.68)
  end

  it 'should calculate the total sales taxes' do
    receipt = Receipt.new
    receipt.add_item('1, imported bottle of perfume, 27.99')
    receipt.add_item('2, bottle of perfume, 18.99')
    receipt.add_item('3, packet of headache pills, 9.75')
    receipt.add_item('4, box of imported chocolates, 11.25')

    expect(receipt.total_sales_tax).to be(10.25)
  end
end
