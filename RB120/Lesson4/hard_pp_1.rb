# Q1: Alyssa has been assigned a task of modifying a class that was initially created to keep track of secret information. The new requirement calls for adding logging, when clients of the class attempt to access the secret data.
# She needs to modify it so that any access to data must result in a log entry being generated. That is, any call to the class which will result in data being returned must first call a logging class.

class SecretFile
  def initialize(secret_data, log)
    @data = secret_data
    @security_log = log
  end
  
  def data
    @security_log.create_log_entry
    @data
  end
end

class SecurityLogger
  def create_log_entry
    puts "Created a log entry"
    # ... implementation omitted ...
  end
end

log_one = SecurityLogger.new
new_file = SecretFile.new("Secret info", log_one)
puts new_file.data

# Q2: Modify the class definitions and move code into a Module, as necessary, to share code among the Catamaran and the wheeled vehicles.

class Vehicle
  attr_accessor :speed, :heading

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

module Tires
  attr_accessor :tires 

  def init_tires(tire_array)
    @tires = tire_array
  end
  
  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < Vehicle
  include Tires
  
  def initialize
    # 4 tires are various tire pressures
    super(50, 25.0)
    init_tires([30,30,32,32])
  end
end

class Motorcycle < Vehicle
  include Tires

  def initialize
    # 2 tires are various tire pressures
    super(80, 8.0)
    init_tires([20,20])
  end
end

class Catamaran < Vehicle
  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    super(km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

# Q3: Building on the prior vehicles question, we now must also track a basic motorboat. A motorboat has a single propeller and hull, but otherwise behaves similar to a catamaran. Therefore, creators of Motorboat instances don't need to specify number of hulls or propellers. How would you modify the vehicles code to incorporate a new Motorboat class?

class Motorboat < Catamaran
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super (1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end
# In retrospect my answer for Q2 was very different from the official answer mostly because I kinda misunderstood the original question. So that changed my approach on Q3 here as well. Obviously I checked the answers later and instead of rewriting my answers to match decided to leave them as is for posterity.

# Q4: Alter the code related to vehicles so that the range for autos and motorcycles is still calculated as before, but for catamarans and motorboats, the range method will return an additional 10km.

# Write a new range method inside Catamaran which inherits from Vehicle.
# def range
#   super + 10
# end

# Again I'm not too happy with the structure as it ended up, I'd totally redo it but what's the point in writing something exactly like the supplied answers?