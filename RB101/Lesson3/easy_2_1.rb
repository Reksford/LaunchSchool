ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

puts ages.has_key?("Spot")

puts ages.include?("Spot")

puts ages.select {|name, age| name == "Spot"}