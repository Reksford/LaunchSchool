# I abridge the questions here because the originals are long and role-play-ish
# Q1: Is the syntax okay in the positive_balance? method or do you need to use @balance to reference the instance variable.

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end
#The attr_reader sets up a balance method that returns @balance so this code is perfectly fine.

# Q2: The update_quantity method does not work, why?

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end
# Currently the update_quantity method creates a new local variable called quantity instead of changing the instance variable @quantity because there is only a getter method created for @quantity not a setter method.
# Either a setter method should be defined; an `attr_writer :quantity` could be added in; or specifically use @quantity.

# Q3: What is the problem of solving the above problem by using `attr_accessor :quantity`?

#The purpose of the update_quantity method is to limit what kind of values can actually be set to @quantity. By setting up an attr_accessor the update_quantity method can be easily bypassed and any value assigned to @quantity.

# Q4: Create a class called Greeting with a single method called greet that takes a string argument and prints that argument to the terminal.
#Now create two other classes that are derived from Greeting: one called Hello and one called Goodbye. The Hello class should have a hi method that takes no arguments and prints "Hello". The Goodbye class should have a bye method to say "Goodbye". Make use of the Greeting class greet method when implementing the Hello and Goodbye classes - do not use any puts in the Hello or Goodbye classes.

class Greeting
  def greet(enter_string)
    puts enter_string
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.new.hi
Goodbye.new.bye

# Q5: Add to the following class to get the expected outputs.

class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end
  #Write code below
  
  def to_s
    if @glazing
      "#{@filling_type || 'Plain'} with #{@glazing}"
    else
      "#{@filling_type || 'Plain'}"
    end
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
#  => "Plain"

puts donut2
#  => "Vanilla"

puts donut3
#  => "Plain with sugar"

puts donut4
#  => "Plain with chocolate sprinkles"

puts donut5
#  => "Custard with icing"

# Q6: What is the differance between these two classes and their methods?

class ComputerOne
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class ComputerTwo
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# These are actually functionally the same. ComputerTwo uses `self` while not necessary in the show_template method and ComputerOne is the cleaner looking code.

# Q7: How could you change the method name below so that the method name is more clear and less repetitive?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.light_information
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end

end

# The way method is now it would be called as: Light.light_information
# Change the method definition to `self.information`