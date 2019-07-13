[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
# => true
# The block's return value is the last evaluated line num.odd?
# any? returns true if at any point the block returns true
# Since the very first number passed in 1 is odd; num.odd? returns
# true and any? stops looping through the array and returns true.
# That is why only 1 is displayed to console and not the other numbers.