arr = ['10', '11', '9', '7', '8']

arr_sort = arr.sort_by do |item|
  item.to_i
end

p arr_sort #Ascending order

arr_sort_2 = arr.sort do |first, second|
  second.to_i <=> first.to_i
end

p arr_sort_2