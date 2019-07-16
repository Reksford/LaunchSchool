ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# Add up all the ages

total = 0
ages.each_value do |age|
  total += age
end
p total
