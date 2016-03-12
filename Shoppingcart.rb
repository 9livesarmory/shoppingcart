
class ShoppingCart  #create ShoppingCart class
  	def initialize
      @items = []
  	end

  	def add_item(item)
      @items.push(item) #Add your item to @items array
  	end

  	def checkout  #function to add all item prices and give total
  		total=0
  		subtotal=0
	  	  @items.each do |item|  #loop through item array
	  	  	if @items.length > 5
	  	  		subtotal+=item.price
	  	  		total=subtotal-(subtotal*0.05)
	  	  	else
	  		total+=item.price  #grab item prices and add them into total
	  		end
		end
		
		return total
	end
end




class Item  #create item class.  By default, items will have no discount.
	attr_reader :name, :price   #accessor for name and price variables
	def initialize(name, price)  #require name and price for each item
		@name=name
		@price=price
	end

	def price #function to calc the price of item
	  calculated_price=@price#setting variable to base price first
  	return calculated_price
  	end

end


class Houseware < Item
	def price
      #If the price is greater than $100, there will be a 5% discount
    	if @price > 100
    	percentoff=0.05
      	discount=@price*percentoff
      	calculated_price=@price - discount

    	else
	  	calculated_price=@price  
	  	return calculated_price
	
  		end
	end
end


class Fruit < Item
	def price
     #Fruits have no discount during weekdays but on weekends they have a 10% discount
    	date = Time.new  #.time method to create a time instance

		if date.saturday? || date.sunday?
      	percentoff=0.10  
      	discount=@price*percentoff
      	calculated_price=@price - discount

  		else
	  	calculated_price=@price  
	  	return calculated_price
		end

	end
	#calculated_price=@price+300  #doing this as a test to check inheritance
 	#end
end



class Grains < Item
		def price
			calculated_price=@price #no discounts available
		end
end




anchovies=Item.new("Anchovies", 10)
orange_juice=Fruit.new("Orange Juice",10)
vacuum_cleaner=Houseware.new("vacuum cleaner",150)
banana=Fruit.new("Banana",5)
rice=Item.new("rice",1)

puts banana.price
puts orange_juice.price
puts vacuum_cleaner.price
puts anchovies.price

michelles_cart=ShoppingCart.new
michelles_cart.add_item(banana)
michelles_cart.add_item(orange_juice)
michelles_cart.add_item(vacuum_cleaner)
michelles_cart.add_item(anchovies)
#michelles_cart.add_item(anchovies)
#michelles_cart.add_item(anchovies)
puts michelles_cart.checkout

#shows 166.00 if items 4 items in cart (no cart disc)
#shows 176.70 if uncomment the 2 extra anchovies which includes the final 5% cart disc.


