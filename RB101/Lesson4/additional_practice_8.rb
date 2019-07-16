# Array#each works by setting an index to 0 then incrementing it by 1
# for each pass through the loop. It also seems to be aware of the
# length of the array through each pass.

puts 'Shift'

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
# => 1
# => 3
# #shift removes the first element then 'shifts' all elements over
# so 1 is printed to the screen and removed. 2 moves over to where
# 1 was (numbers[0]) and now 3 is at numbers[1]. Which is the next 
# iteration of the loop. That get printed then removed; then 4
# slides over to numbers[1].

puts 'Pop'

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# => 1
# => 2
# #pop removes from the end of the array so while 1 is being printed
# 4 is being removed. This behavior simply causes the loop to end
# early because 3 and 4 have been removed.