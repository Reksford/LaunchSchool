['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
# => 2
# if a block is used with the count method it will loop through each
# element and add to the count everytime the block evaluates true.
# This can be read up on in the documentation for Enumerable#select
