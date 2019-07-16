words = "the flintstones rock"
# Capitalize each word
words = words.split.each {|word| word.capitalize!}.join(' ')
p words

# Solution
# words.split.map { |word| word.capitalize }.join(' ')

# Again, I miss a perfect opportunity to use #map.
# #each returns the array itself, #map returns a new array
# with the return value of each block written in each entry
# instead of relying on mutating the caller with #each.