require_relative 'product'
require_relative 'shop'

class Online
  def initialize
    @shop = Shop.new
  end

  def start
    loop do
      puts "1. Add Product"
      puts "2. View Stock"
      puts "3. Make Sale"
      puts "4. Exit"
      print "Choose an option (1-4): "
      option = gets.to_i

      case option
      when 1
        add_product_dynamically
      when 2
        @shop.view_stock
      when 3
        make_sale
      when 4
        break
      else
        puts "Invalid option. Please choose again."
      end
    end
  end

  private

  def add_product_dynamically
    puts "Enter product details:"
    print "Name: "
    name = gets.chomp
    print "Price: "
    price = gets.to_f
    print "Stock Quantity: "
    stock_quantity = gets.to_i
    product = Product.new(name, price, stock_quantity)
    @shop.add_product(product)
    puts "#{name} added to the stock."
  end

  def make_sale
    print "Enter product name: "
    product_name = gets.chomp
    print "Enter quantity to sell: "
    quantity = gets.to_i
    @shop.sale(product_name, quantity)
  end
end

online_instance = Online.new
online_instance.start
