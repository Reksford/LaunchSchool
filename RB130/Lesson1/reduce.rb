def reduce(array, accumulator = nil)
  new_item = nil
  case
  when array[0].class == String
    accumulator ||= ""
  else
    accumulator ||= 0
  end

  array.each do |item|    
    new_item = yield(accumulator, item)
    accumulator = new_item
  end
  
  new_item
end
