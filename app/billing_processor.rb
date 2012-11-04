
#Acts like a Factory to built billing data.
class BillingProcessor

  attr_accessor :bill

  def initialize
    @bill = Bill.new()
  end
  
  
  def add_billable_item(item)
    @bill.add_item(item)
  end

  def add_bill_user(user_attr)
    @bill.add_user(user_attr)
  end

  #returns final amount that user needs to be pay.
  def get_billable_net_amount
    @bill.calculate_net_amount()
  end

end