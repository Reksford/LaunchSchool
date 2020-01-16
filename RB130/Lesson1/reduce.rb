def reduce(array, accumulator = nil)
  new_item = nil
  accumulator ||= 0 #Sets accumulator if none given

  array.each do |item|    
    new_item = yield(accumulator, item)
    accumulator = new_item
  end
  
  new_item
end
