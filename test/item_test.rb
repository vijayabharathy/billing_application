require 'test/unit'
require './app/item'

class ItemTest < Test::Unit::TestCase
  def setup
    @item = Item.new()
    @item.item_code = 'CODE'
    @item.price = 100
    @item.quantity = 1
  end

  def test_is_grocery_item
    @item.item_type = 'G'
    assert @item.is_grocery?

    @item.item_type = 'NG'
    assert !@item.is_grocery?
  end

  def test_default_item_type
    @item.item_type = 'NG'
    assert_equal 'NG', @item.item_type
    assert_equal 'NG', Item.new().item_type
  end


end