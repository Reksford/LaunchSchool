[1, 2, 3].select do |num|
  num > 5
  'hi'
end
# => [1, 2, 3]
# Since 'hi' is the last line to be evaluated in the block
# this block always returns a truthy value meaning that
# every element gets added into a new array and returned.