def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  puts a_string_param.object_id
  an_array_param << "rutabaga"
  puts an_array_param.object_id
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string} with id: #{my_string.object_id}"
# the reassignment in the method changes the id that the string
# param is pointing to.
puts "My array looks like this now: #{my_array} with id: #{my_array.object_id}"
# the << operator mutates the array it is being called on
# Not reassigning it to a differant updated id