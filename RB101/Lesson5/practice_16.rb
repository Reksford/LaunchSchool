def get_a_UUID
  hexadecimal = ['1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']
  
  uuid_arr = []
  36.times { uuid_arr.push(hexadecimal.sample) }
  uuid_arr.each_with_index do |_, index|
    if index == 8 || index == 13 || index == 18 || index == 23
      uuid_arr[index] = '-'
    end
  end
  uuid_arr.join
end

p get_a_UUID