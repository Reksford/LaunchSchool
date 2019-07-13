[1, 2, 3].reject do |num|
  puts num
end
# => [1, 2, 3]
# reject returns a new array containing all elements for which the
# block evaluates as false. The puts method returns nil so the block
# evaluates false everytime passing all elements to its return array.