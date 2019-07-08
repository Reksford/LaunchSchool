def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# rolling_buffer1 uses << to first add a new_element to the buffer
# which mutates the buffer before checking to see if the buffer is
# over its max. Then if it already exceeded the max will shift an
# element away and return the buffer.

# rolling_buffer2 adds the new_element to an array but does not
# mutate the original input_array then checks if it is under
# the allowed buffer size.  
