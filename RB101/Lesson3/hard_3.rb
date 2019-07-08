one = "one"
two = "two"
three = "three"

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

def mess_with_vars_a(one, two, three)
  one = two
  two = three
  three = one
end

def mess_with_vars_b(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

def mess_with_vars_c(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

# only mess_with_vars_c will change the puts below from the one above.
mess_with_vars_c(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"