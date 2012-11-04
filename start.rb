#!/usr/bin/env ruby

require './app/billing_processor'
require './app/bill'
require './app/user'
require './app/item'
require './app/discount_processor'



puts "Enter items one by one at the end type 'q' to see the receipt output"


item_count = 1
add_item = 'c'


billing_processor = BillingProcessor.new()
user_attr = {}

puts "Enter User CODE"
user_attr[:user_id] = gets.strip

puts "Enter User Type(employee -> E, affiliate user -> A, Two year old customer -> C, For Others -> N):"
user_attr[:user_type] = gets.strip

billing_processor.add_bill_user(user_attr)


while (add_item == "c")

  item = Item.new
  puts "ITEM #{item_count}"
    item.item_code = "Item-#{item_count}"

  puts "Enter item type(grocery item type -> (G), for others type (NG)):"
    item.item_type = gets.strip

  puts "Enter Item price:"
    item.price = gets.strip

  puts "Enter Item Quantity:"
    item.quantity = gets.strip

  billing_processor.add_billable_item(item)

  item_count += 1

  puts "Enter 'c' to continue or 'q' to see output:"
   add_item = gets.strip

end





puts "TOTAL NET AMOUNT : #{billing_processor.get_billable_net_amount}"




