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