statement = "The Flintstones Rock"
# Creat a hash that expresses the frequency with which each letter occurs in this string
# expect => { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
index = {}
statement.gsub(/\s+/, '').chars.sort.each do |char|
  if index[char]
    index[char] += 1
  else
    index[char] = 1
  end
end
# Was getting spaces tallied at the beginning but didn't see
# any in example so cut whitespace out of string.
p index

index_2 = {}
statement.gsub(/\s+/, '').chars.sort.each do |char|
  index_2[char] &&= index_2[char] + 1
  index_2[char] ||= 1
end
# Saw these two in Abbreviated Assignment and I think they're nifty.
# value ||=  makes an assignment if the value is nil or false.
# value &&=  will make an assignment only if the value is not nil or false.


# Solution from text:
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
# An interest solution of iteration through the whole alphabet
# then checking each letter against the string to form keys
# and their frequency. Really flips the problem around in my mind.