arr = [ {a: [1, 2, 3]}, 
        {b: [2, 4, 6], c: [3, 6], d: [4]},
        {e: [8], f: [6, 10]}]
# Return an array which contains only the hashes where all the integers are even.

even_hashs = arr.select do |hsh|
  hsh.all? do |k, value|
    value.all? do |num|
      num.even?
    end
  end
end

p even_hashs