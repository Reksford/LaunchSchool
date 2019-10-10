# Q1: If we have the following code what happens in each of the following cases?
class Greeting
  def greet(message)
    puts message
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
hello = Hello.new
# Case 1
hello.hi # Succesfully outputs "Hello"
# Case 2
  # hello.bye
  # This code raises an exception. There is no `bye` method availabe to Hello objects, only instances of Goodbye have this method.
# Case 3
  # hello.greet
  # This code raises an exception. The `greet` method inherited from Greeting needs an argument.
# Case 4
hello.greet("Goodbye") # Succesfully outputs "Goodbye"
# Case 5
  # Hello.hi
  # This code raises an exception. There is no class method `hi` for the Hello class.
  
# Q2: If we call Hello.hi we get an error message. How would you fix this?

# A class method for `hi` would have to be defined inside Hello.
#class Hello
  #def self.hi
    #To have the save functionality as the instance method `hi` a new Greeting object would have to be instantiated here to allow the instance method `greet` to be called on it.
  #end
#end

# Q3: When objects are created they are a separate realization of a particular class.
# Given the class below, how do we create two different instances of this class, both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end
# Assign the newly created AngryCat objects to different variables.
fluffy = AngryCat.new(2, "fluffy")
tuffy = AngryCat.new(6, "tuffy")

# Q4: Given the class below, if we created a new instance of the class and then called to_s on that instance we would get something like "#<Cat:0x007ff39b356d30>"
# How could we go about changing the to_s output on this method to look like this: I am a tabby cat (this is assuming that "tabby" is the type we passed in during initialization)?

class Cat
  def initialize(type)
    @type = type
  end
  # Define a new `to_s` method inside the class that will be called instead of an ancestors `to_s` method.
  def to_s
    "I am a #{@type} cat"
  end
end

muffin = Cat.new("tabby")
puts muffin

# Q5: With the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
# What happens with the following method calls?
tv = Television.new
#tv.manufacturer
  #Raises an exception. NoMethodError
tv.model #=> would run the method logic for the `model` instance method.

Television.manufacturer #=> would run the method logic for the `manufacturer` class method.
#Television.model
  #Raises an exception. NoMethodError
  
# Q6: In the make_one_year_older method we have used self. What is another way we could write this method so we don't have to use the self prefix?

class Catt
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
    # @age += 1
  end
end
# increment the `@age` instance variable without using the accessor setter method.

# Q7: What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end
end

# "value" is really a vague term to throw around in such a question.
# LaunchSchool's solution points to the `return` keyword as not adding any value since Ruby always returns the last evaluated line of a method. True.
# However I dissagree with their assessment to avoid using the `return` keyword. I see nothing wrong with using very clear and intentional return statements instead of always relying on Ruby's implicit return functionality.
# Also, since many other programming languages require explicit return statements, how can fostering a habit of not using (or removing) return statements be beneficial in the long run?