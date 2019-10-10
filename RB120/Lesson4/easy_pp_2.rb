# Q1: You are given the following code

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end
# What is the result of calling:
oracle = Oracle.new
oracle.predict_the_future
# The predict_the_future method is invoked returning the string "You will " concatenated to a string sampled from the array returned from calling the choices method.

# Q2: We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end
# What is the result of the following?
trip = RoadTrip.new
trip.predict_the_future
# This time when inside the predict_the_future method the choices method is invoked it will be the choices method as defined in the RoadTrip class. This is because Ruby looks for a method definition first in the current class before checking up each ancestor.

# Q3: How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors? What is the lookup chain for Orange and HotSauce?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end
# An objects ancestors can be looked up by calling the ancestors method on it. This will show all the places Ruby will look for a method and the order in which it will search.
Orange.ancestors #=> [Orange, Taste, Object, Kernel, BasicObject]
HotSauce.ancestors #=> [HotSauce, Taste, Object, Kernel, BasicObject]

# Q4: What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end
# The type method and the type= method can both be replaces by adding an accessor written as: `attr_accessor :type`

# Q5: There are a number of variables listed below. What are the different types and how do you know which is which?

# excited_dog = "excited dog"
# @excited_dog = "excited dog"
# @@excited_dog = "excited dog"

# @ and @@ are used to make instance variables and class variables respectively. The first variable excited_dog is just a regular local variable.

# Q6: If I have the following class; which one of these is a class method (if any) and how do you know? How would you call a class method?

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
# The manufacturer method is a class method. Inside the class definition `self` refers to the class. This method is set up to be called on the class itself like so:
Television.manufacturer

# Q7: If we have a class such as the one below; explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

class Cat
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
# The @@cats_count class variable gets incremented by 1 every time a new cat object is instantiated. The class method cats_count returns the @@cats_count variable which makes checking on the value very easy.
fluffy = Cat.new("kitten")
tuffy = Cat.new("kitten")
# Now that we have two instances of the Cat object the @@cats_count should be at 2.
puts Cat.cats_count #=> 2

# Q8: If we have the following classes; what can we add to the Bingo class to allow it to inherit the play method from the Game class?

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    "Some rules."
  end
end
# Bingo should inherit from the Game class. `class Bingo < Game`

# Q9: What would happen if we added a play method to the Bingo class, keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.

# If a Bingo object was instantiated and the play method was called on it the play method first defined in the Bingo method would be called.

# Q10: What are the benefits of using Object Oriented Programming in Ruby?

# Abstracting code into a class or module that can be used multiple times for various applications.
# Having private and public methods allows only the necessary parts of an objects functionality to be exposed for use while keeping other parts safe from unforseen conflicts.