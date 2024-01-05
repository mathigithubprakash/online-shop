# Why you need below Product class, you have already seperated product class to different file 
# You should add/required to load the file 
class Product
  attr_accessor :name, :price, :stock_quantity

  def initialize(name, price, stock_quantity)
    @name = name
    @price = price
    @stock_quantity = stock_quantity
  end

  def update_price(new_price)
    @price = new_price
    puts "Price updated for #{name} to #{new_price}."
  end
end

# Same goes here
class Shop
  attr_accessor :products

  def initialize
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def view_stock
    puts "Current Stock:"
    @products.each do |product|
      puts "#{product.name}: #{product.stock_quantity}"
    end
  end

  def sale(product_name, quantity)
    product = find_product(product_name)
    if product && product.stock_quantity >= quantity
      product.stock_quantity -= quantity
      puts "Sale successful! #{quantity} #{product.name}(s) sold."
    else
      puts "Not enough stock for #{product_name}."
    end
  end

  private

  def find_product(product_name)
    @products.find { |product| product.name == product_name }
  end
end

shop = Shop.new

# can you move below logic to product class itself?
# and rename this file to online_shop as mail class or module?
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

loop do
  puts "1. Add Product"
  puts "2. View Stock"
  puts "3. Make Sale"
  puts "4. Exit"
  print "Choose an option (1-4): "
  option = gets.to_i

  case option
  when 1
    add_product_dynamically(shop)
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
