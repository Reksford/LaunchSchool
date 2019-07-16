ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# Find minimum age
def find_youngest (hash)
  lowest = nil
  hash.each_value do |age|
    lowest ||= age
    if lowest > age
      lowest = age
    end
  end
  hash.slice(hash.key(lowest))
end

p find_youngest(ages)

# ages.values.min