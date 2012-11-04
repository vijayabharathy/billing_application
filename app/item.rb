class Item

  #below constants refers item types.
  GROCERY = 'G'
  NON_GROCERY = 'NG'

  attr_accessor :quantity, :price, :item_type, :item_code, :price_after_discount


  def is_grocery?
    item_type == GROCERY
  end

  #by default item type will be non grocery.
  #if no item type mentioned.
  def item_type
    @item_type || NON_GROCERY
  end

  #always quantity should be integer
  def quantity
    @quantity.to_i
  end

  #always price should be float
  def price
    @price.to_f
  end

end