require 'test/unit'
require './app/billing_processor'
require './app/bill'
require './app/user'
require './app/item'
require './app/discount_processor'


class FullStackTest < Test::Unit::TestCase

  def test_with_employee
    billing_processor = BillingProcessor.new
    user_attr={:user_id => "Employee-ID", :user_type => 'E'}
    billing_processor.add_bill_user(user_attr)

    item = Item.new()
    item.item_code = 'CODE'
    item.item_type = 'NG'
    item.price = 100
    item.quantity = 2

    billing_processor.add_billable_item(item)
    net_amount = billing_processor.get_billable_net_amount

    assert_equal 135, net_amount
  end

  def test_with_affiliate_user
    billing_processor = BillingProcessor.new
    user_attr={:user_id => "AFFIIIATE-ID", :user_type => 'A'}
    billing_processor.add_bill_user(user_attr)

    item = Item.new()
    item.item_code = 'CODE'
    item.item_type = 'NG'
    item.price = 250
    item.quantity = 1

    billing_processor.add_billable_item(item)
    net_amount = billing_processor.get_billable_net_amount

    assert_equal 215, net_amount
  end

  def test_with_2_yrs_old_customer
    billing_processor = BillingProcessor.new
    user_attr={:user_id => "2-yr-old-ID", :user_type => 'C'}
    billing_processor.add_bill_user(user_attr)

    item = Item.new()
    item.item_code = 'CODE'
    item.item_type = 'NG'
    item.price = 150
    item.quantity = 1

    billing_processor.add_billable_item(item)
    net_amount = billing_processor.get_billable_net_amount

    assert_equal 137.5, net_amount
  end

  def test_with_grocery_item
    billing_processor = BillingProcessor.new
    user_attr={:user_id => "2-yr-old-ID", :user_type => 'C'}
    billing_processor.add_bill_user(user_attr)

    item = Item.new()
    item.item_code = 'CODE'
    item.item_type = 'G'
    item.price = 150.5
    item.quantity = 1

    billing_processor.add_billable_item(item)
    net_amount = billing_processor.get_billable_net_amount

    assert_equal 145.5, net_amount
  end

  def test_with_non_grocery_item
    billing_processor = BillingProcessor.new
    user_attr={:user_id => "Normal-ID", :user_type => 'N'}
    billing_processor.add_bill_user(user_attr)

    item = Item.new()
    item.item_code = 'CODE'
    item.item_type = 'NG'
    item.price = 50
    item.quantity = 1

    billing_processor.add_billable_item(item)
    net_amount = billing_processor.get_billable_net_amount

    assert_equal 50, net_amount
  end

end