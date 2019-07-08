def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size == 4
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      return false unless is_an_ip_number?(word)
    end
    true
  else
    false
  end
end

def is_an_ip_number?(num)
  if num.to_i.to_s == num
    (0..255).cover?(num.to_i)
  else
    false
  end  
end


p dot_separated_ip_address?('123.84.0.1')
p dot_separated_ip_address?('456.Hi.1.1')