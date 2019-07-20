arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
# Order by odd numbers

sorted = arr.sort do |a, b|
  a.select {|num| num.odd?} <=> b.select {|num| num.odd?}
end

p sorted
