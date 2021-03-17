require 'spec_helper'
require_relative '../item_parser'

RSpec.describe ItemParser do

  it 'should parse an imported item' do
    item = ItemParser.parse_item('1, imported bottle of perfume, 27.99')
    expected_item = Item.new('imported bottle of perfume', 1, 27.99, true)

    expect(item.name).to eq(expected_item.name)
    expect(item.quantity).to be(expected_item.quantity)
    expect(item.price).to be(expected_item.price)
    expect(item.is_imported).to be(expected_item.is_imported)
  end

  it 'should parse a local item' do
    item = ItemParser.parse_item('1, bottle of perfume, 18.99')
    expected_item = Item.new('bottle of perfume', 1, 18.99, false)

    expect(item.name).to eq(expected_item.name)
    expect(item.quantity).to be(expected_item.quantity)
    expect(item.price).to be(expected_item.price)
    expect(item.is_imported).to be(expected_item.is_imported)
  end

  it 'should parse local medicine' do
    item = ItemParser.parse_item('1, packet of headache pills, 9.75')
    expected_item = Item.new('packet of headache pills', 1, 9.75, false)

    expect(item.name).to eq(expected_item.name)
    expect(item.quantity).to be(expected_item.quantity)
    expect(item.price).to be(expected_item.price)
    expect(item.is_imported).to be(expected_item.is_imported)
  end

  it 'should parse imported food' do
    item = ItemParser.parse_item('1, box of imported chocolates, 11.25')
    expected_item = Item.new('box of imported chocolates', 1, 11.25, true)

    expect(item.name).to eq(expected_item.name)
    expect(item.quantity).to be(expected_item.quantity)
    expect(item.price).to be(expected_item.price)
    expect(item.is_imported).to be(expected_item.is_imported)
  end

  it 'should handle multitple quantities' do
    item = ItemParser.parse_item('5, box of imported chocolates, 11.25')

    expect(item.quantity).to be(5)
  end

end