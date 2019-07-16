flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys 
# and the values are the positions in the array.

hash_a = flintstones.each_with_object({}) do |name, new_hash|
  new_hash[name] = flintstones.find_index(name)
end

# I initially wanted to make a nested array to convert to hash
# and saw this example in the docs under #map using #with_index
# #map in this instance returning an enumerator.
hash_b = flintstones.map.with_index do |name, index|
  [name, index]
end
hash_b = hash_b.to_h

hash_c = {}
flintstones.each_with_index do |name, index|
  hash_c[name] = index
end

p hash_a
p hash_b
p hash_c