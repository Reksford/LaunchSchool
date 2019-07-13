[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
# => [1, nil, nil]
# If the passed in number is not greater than one the code after else
# runs and the number is returned to the new array that map returns.
# For numbers over one the puts method runs which has a return value
# of nil, thus filling our array with nils.