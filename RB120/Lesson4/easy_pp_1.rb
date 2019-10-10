#Q1: Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?

true.class #=> Boolean
"hello".class #=> String
[1, 2, 3, "happy days"].class #=> Array
142.class #=> Integer
#These are all objects in Ruby and have access to the #class method.

#Q2: If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the ability for them to go_fast using the module Speed? How can you check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

Car.new.go_fast
Truck.new.go_fast
#Include the Speed module in each class and call the go_fast method on a new Car or Truck object.

#Q3: In the last question we had a module called Speed which contained a go_fast method. We included this module in the Car class as shown below. When we called the go_fast method from an instance of the Car class you might have noticed that the string printed when we go fast includes the name of the type of vehicle we are using. How is this done?

# The go_fast method is being called from an instance of the car class. self.class is interpolated into a string. #self is the current object, the new instance of the car class, and so the #class method returns the class.

#Q4: If we have a class AngryCat how do we create a new instance of this class?

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

mr_whiskers = AngryCat.new
#Call the #new method on the AngryCat class.

#Q5: Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end
#Pizza has an instance variable. In ruby instance variables are made using the @ symbol at the beginning. This is syntax, not a convention.

#Q6: What could we add to the class below to access the instance variable @volume?

class Cube
  def initialize(volume)
    @volume = volume
  end
  
  def volume_get
    @volume
  end
end
#An accessor could be added such as `attr_reader :volume` or make a new function like volume_get added above.

#Q7: What is the default return value of to_s when invoked on an object? Where could you go to find out if you want to be sure?

#The default to_s method is defined in the Ruby class Object where the documentation reads "The default to_s prints the object's class and an encoding of the object id."

#Q8: If we have a class such as the one below:
# You can see in the make_one_year_older method we have used self. What does self refer to here?

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end
# `self` refers to an instantiated instance of the object.
# If cat1 = Cat.new
# then cat1.make_one_year_older would be the same as cat1.age += 1

# Q9: If we have a class such as the one below: (Name changed to prevent conflict above)
#In the name of the cats_count method we have used self. What does self refer to in this context?

class CatTwo
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end
# The self.cats_count method being defined is a class method. The `self` refers to the class itself; specifically in this case CatTwo.

# Q10: If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# Call the new method on the class. In this case, two arguments would also be expected with the method call. It would look like:
Bag.new("Black", "Leather")