arr = [1, 2, 3, 4, 5]
arr.take(2)
# => [1, 2]
# A very succinct definition for take from the documentation:
# "take(n) Returns first n elements from enum." Take returns
# these elements as an array or for hashes a nested array of [key,
# value]. This is a non-destuctive method which can be tested by
# checking the value of the original array:
p arr # => [1, 2, 3, 4, 5]