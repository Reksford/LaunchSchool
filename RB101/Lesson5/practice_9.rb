arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr_sorted = arr.map do |sub|
  sub.sort {|a, b| b <=> a}
end

p arr_sorted