a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2 # Makes a change to arr, does not reference a
arr[1][0] -= a # References b so changes b and arr

p a # => 2
p b # => [3, 8]
p arr