# Practicing loops along with topic 6 "Selection and Transformation"
# Also wanted a bit of practice with writing case statements.

my_numbers = [1, 4, 3, 7, 2, 6]

def multiply_numbers(numbers, multiplier, index = false)
# Takes an array of numbers, a multiplier number,
# and optionally applies multiplier only to odd or even indices.
  counter = 0
  returned_numbers = []

  loop do
    case index
      when :even
        if counter.even?
          returned_numbers << numbers[counter] * multiplier
        else
          returned_numbers << numbers[counter]
        end
      when :odd
        if counter.odd?
          returned_numbers << numbers[counter] * multiplier
        else
          returned_numbers << numbers[counter]
        end
      else
        returned_numbers << numbers[counter] * multiplier
    end    
    counter += 1
    break if counter >= numbers.length
  end
  returned_numbers
end

p my_numbers
p multiply_numbers(my_numbers, 5)
p multiply_numbers(my_numbers, 10, :odd)
p multiply_numbers(my_numbers, 2, :even)