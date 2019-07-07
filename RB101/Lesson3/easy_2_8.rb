advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice(0, advice.index("house"))
puts advice

p advice.slice!(0, advice.index("house"))
puts advice

# each slice returns the same value; but after slice! is called the string
# advice points to gets mutated.