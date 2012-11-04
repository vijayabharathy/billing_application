
class DiscountProcessor

#below are the discount percentage
  Grocery = 0
  EMPLOYEE = 30
  AFFILIATE = 10
  TWO_YEAR_OLD_CUSTOMER = 5
  EACH_HUNDRED_DOLLAR = 5


#return the amount for item depends on the item quantity
  def calculate_item_amount(quantity, price)
    if quantity < 1 || price < 0
      0
    else
      quantity * price
    end
  end



  #calculate item amount based on user type and item type
  #discount should not applied for grocery item.
  def calculate_item_amount_with_discount(item, user)

    item_bill_amount = calculate_item_amount(item.quantity, item.price)
    return item_bill_amount if item.is_grocery? 


    return item_bill_amount - (item_bill_amount * get_discount_percentage(user))/100
  end


  def get_discount_percentage(user)
    case user.user_type
      when User::EMPLOYEE
        EMPLOYEE
      when User::AFFILIATE
        AFFILIATE
      when User::TWO_YEAR_OLD_CUSTOMER
        TWO_YEAR_OLD_CUSTOMER
      else
        0
    end
  end


  #discount applied for every hundred dollar.
  def apply_discount_on_total(total_amount)
     return total_amount if total_amount < 100

     discount_amount = (total_amount.to_i / 100) * EACH_HUNDRED_DOLLAR
     total_amount - discount_amount
  end


end