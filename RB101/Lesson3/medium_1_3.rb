def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# number % divisor == 0 
# any number divided by one of its factors will have no remainder

# line 8 factors
# ensures that the method will return factors