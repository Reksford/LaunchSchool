# puts "the value of 40 + 2 is " + (40 + 2)
# Throws a TypeError because to concatenate onto a string with "+"
# needs another string.

puts 'the value of 40 + 2 is ' + (40 + 2).to_s

puts "the value of 40 + 2 is #{40 + 2}"