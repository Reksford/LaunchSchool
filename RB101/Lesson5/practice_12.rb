arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
hashed = {}

arr.each do |sub|
  hashed[sub[0]] = sub[1]  
end

p hashed