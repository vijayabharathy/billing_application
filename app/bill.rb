class Bill

  attr_accessor  :user, :items

   def initialize
     @items = [] #can add more than one item to the bill.
     @discount_processor = DiscountProcessor.new()
   end

   def add_item(item)
    @items.push(item)
   end

   def add_user(user_attr)
     @user = User.new(:user_id => user_attr[:user_id], :user_type => user_attr[:user_type])
   end

  #final bill amount and apply discount if needed.
  def calculate_net_amount
    @items.each do |item|
      item.price_after_discount = @discount_processor.calculate_item_amount_with_discount(item, @user)
    end

    #total items bill amount
    items_total = @items.map(&:price_after_discount).reduce(:+)

    #applying discount on total amount.
    @discount_processor.apply_discount_on_total(items_total)
  end



end