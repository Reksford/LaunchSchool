arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
# return a new array identical in structure but with only
# multiples of three.

arr_threes = arr.map do |sub|
  sub.select do |num|
    num % 3 == 0
  end
end

p arr_threes