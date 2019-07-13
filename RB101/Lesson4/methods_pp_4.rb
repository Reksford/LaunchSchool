['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
# => {"a" => "ant", "b" => "bear", "c" => "cat"}
# In this each_with_object call the value parameter is refering to
# each element in the array and the hash parameter points to the empty
# hash given as the argument in (). The block adds new entries to
# hash with assignment where value[0] points to the first letter
# of each word. each_with_object the returns the same object that was
# given as an argument.