require 'test/unit'
require './app/bill'
require './app/user'
require './app/item'
require './app/discount_processor'

class BillTest < Test::Unit::TestCase

  def setup
    @bill = Bill.new
  end

  def test_add_user
    user_attr={:user_id => "Employee-ID", :user_type => 'E'}
    @bill.add_user(user_attr)
    assert_equal user_attr[:user_id], @bill.user.user_id
  end

  def test_add_item
    non_grocery_item = Item.new()
    non_grocery_item.item_code = 'CODE'
    non_grocery_item.item_type = 'NG'
    non_grocery_item.price = 100
    non_grocery_item.quantity = 2

    @bill.add_item(non_grocery_item)
    assert_equal 1, @bill.items.length

    grocery_item = Item.new()
    grocery_item.item_code = 'CODE'
    grocery_item.item_type = 'G'
    grocery_item.price = 100
    grocery_item.quantity = 2

    @bill.add_item(non_grocery_item)
    assert_equal 2, @bill.items.length

  end


  def test_calculate_net_amount
    user_attr={:user_id => "Employee-ID", :user_type => 'E'}
    @bill.add_user(user_attr)
    non_grocery_item = Item.new()
    non_grocery_item.item_code = 'CODE'
    non_grocery_item.item_type = 'NG'
    non_grocery_item.price = 100
    non_grocery_item.quantity = 2

    @bill.add_item(non_grocery_item)
    net_amount = @bill.calculate_net_amount
    assert_equal 135, net_amount

  end

end
