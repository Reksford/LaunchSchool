hash = { a: 'ant', b: 'bear' }
hash.shift
# => [:a, "ant"]
# As described in the documentation for Hash#shift shift removes
# a key-value pair and returns it as an array [key, value]
# Modern Ruby keeps track of the order entries were made in a hash
# and so shifts the first item then onwards down to the hashes
# default value... as far as I can tell anyways.
# Consider the following:

new_hash = Hash.new
new_hash[:c] = 'First in'
new_hash[:a] = 'Second in'
new_hash['b'] = 'Third in'
new_hash[:a] = 'Changed Second'

p new_hash.shift # => [:c, "First in"]
p new_hash.shift # => [:a, "Changed Second"]
p new_hash.shift # => ["b", "Third in"]
p new_hash.shift # => nil
p new_hash # => {}

# Hash#shift isn't always so straight forward upon further study
# and so with more complex hashes the shift method is less reliable.