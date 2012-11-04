require 'test/unit'
require './app/user'
require './app/item'
require './app/discount_processor'

class DiscountProcessorTest < Test::Unit::TestCase

  def setup
    @user = User.new
    @user.user_id=("Employee-ID")
    @item = Item.new()
    @item.item_code = 'CODE'
    @item.item_type = 'NG'
    @item.price = 100
    @item.quantity = 1

    @discount = DiscountProcessor.new()

  end

  def test_employee_item_discount
    @user.user_type='E'
    item_discount_amount = @discount.calculate_item_amount_with_discount(@item, @user)

    assert_equal 70.0, item_discount_amount
  end

  def test_affilicate_item_user_discount
    @user.user_type='A'
    item_discount_amount = @discount.calculate_item_amount_with_discount(@item, @user)

    assert_equal 90.0, item_discount_amount
  end

  def test_two_yr_old_customer_item_discount
    @user.user_type='C'
    item_discount_amount = @discount.calculate_item_amount_with_discount(@item, @user)

    assert_equal 95.0, item_discount_amount
  end

  def test_normal_user_item_discount
    @user.user_type='N'
    item_discount_amount = @discount.calculate_item_amount_with_discount(@item, @user)

    assert_equal 100.0, item_discount_amount
  end


  def test_net_amount_discount
    assert_equal 190, @discount.apply_discount_on_total(200)
    assert_equal 384, @discount.apply_discount_on_total(399)
    assert_equal 99, @discount.apply_discount_on_total(99)
  end

  def test_item_amount
    assert_equal 100, @discount.calculate_item_amount(1, 100)
    assert_equal 200, @discount.calculate_item_amount(2, 100)
    assert_equal 0, @discount.calculate_item_amount(0, 100)
  end


end