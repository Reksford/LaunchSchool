def select(array)
  counter = 0
  selected_array = []

  while counter < array.size
    if yield(array[counter])
      selected_array.push(array[counter])
    end
    counter += 1
  end
  
  selected_array
end