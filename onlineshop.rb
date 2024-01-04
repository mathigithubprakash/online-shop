require_relative 'product'
require_relative 'shop'

shop = Shop.new
class Online
def add_product_dynamically(shop)
  puts "Enter product details:"
  print "Name: "
  name = gets.chomp
  print "Price: "
  price = gets.to_f
  print "Stock Quantity: "
  stock_quantity = gets.to_i
  product = Product.new(name, price, stock_quantity)
  shop.add_product(product)
  puts "#{name} added to the stock."
end
end
online_instance = Online.new
loop do
  puts "1. Add Product"
  puts "2. View Stock"
  puts "3. Make Sale"
  puts "4. Exit"
  print "Choose an option (1-4): "
  option = gets.to_i
  case option
  when 1
   online_instance.add_product_dynamically(shop)
  when 2
    shop.view_stock
  when 3
    print "Enter product name: "
    product_name = gets.chomp
    print "Enter quantity to sell: "
    quantity = gets.to_i
    shop.sale(product_name, quantity)
  when 4
    break
  else
    puts "Invalid option. Please choose again."
  end
end
