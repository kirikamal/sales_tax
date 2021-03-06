require 'spec_helper'
require_relative '../item.rb'

RSpec.describe Item do

  before(:each) do
    stub_const('Item::SALES_TAX_RATE', 0.10)
    stub_const('Item::IMPORT_TAX_RATE', 0.05)
  end

  it 'should set the name, quantity, and import status' do
    item = Item.new('Cadbury easter chocolates', 1, 10.00, true)
    expect(item.name).to eq('Cadbury easter chocolates')
    expect(item.quantity).to be(1)
    expect(item.is_imported).to be(true)
  end

  it 'should not apply sales tax to an exempted item' do
    item = Item.new('book', 1, 5.00, false)
    expect(item.price).to be(5.00)
  end

  it 'should apply import tax to an exempt imported item' do
    item = Item.new('book', 1, 5.00, true)
    expect(item.price).to be(5.25)
    expect(item.taxes).to be(0.25)
  end

  it 'should apply sales tax to a non-exempt item' do
    item = Item.new('laptop', 1, 500.00, false)
    expect(item.price).to be(550.00)
    expect(item.taxes).to be(50.00)
  end

  it 'should apply sales and import taxes to a non-exempt imported item' do
    item = Item.new('chair', 1, 30.00, true)
    expect(item.price).to be(34.50)
    expect(item.taxes).to be(4.50)
  end

  it 'should round up taxes to the near 5 cents' do
    item = Item.new('backpack', 1, 18.99, false)
    expect(item.price).to be(20.89)
    expect(item.taxes).to be(1.90)
  end

  it 'should apply only import tax to non-exempt imported item' do
    item = Item.new('box of chocolates', 1, 11.25, true)
    expect(item.price).to be(11.85)
    expect(item.taxes).to be(0.60)
  end

  it 'should apply sales tax to a non-exempt item with multiple quantities' do
    item = Item.new('table', 3, 100.00, false)
    expect(item.price).to be(330.00)
  end

end