arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
# Return a new array with each value incremented by 1

arr_2 = arr.map do |hsh|
  new = {}
  hsh.each {|key, val| new[key] = val + 1}
  # each will return the original hash so must save to new hash
  new
end

p arr_2

# this method caught my eye while browsing the docs.
arr_3 = arr.map do |hsh|
  hsh.transform_values {|v| v + 1}
end

p arr_3