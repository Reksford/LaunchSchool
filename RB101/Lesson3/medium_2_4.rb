def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  puts "#{a_string_param.object_id} still original"
  an_array_param = ['pumpkins', 'rutabaga']
  puts "#{an_array_param.object_id} changed"
end

my_string = "pumpkins"
puts "#{my_string.object_id} original string"
my_array = ["pumpkins"]
puts "#{my_array.object_id} original array"
tricky_method_two(my_string, my_array)

puts "My string looks mutated like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"