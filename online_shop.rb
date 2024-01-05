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

 

product1 = Product.new("Laptop", 800, 10)
product2 = Product.new("Smartphone", 500, 20)
product3 = Product.new("tab", 300, 25)
product4 = Product.new("smartwtach",500,15)


shop = Shop.new

shop.add_product(product1)
shop.add_product(product2)
shop.add_product(product3)
shop.add_product(product4)
product1.update_price(900)

shop.view_stock

shop.sale("Laptop", 3)
shop.sale("tab",2)

shop.view_stock
