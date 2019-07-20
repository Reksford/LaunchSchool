hsh = { first: ['the', 'quick'], 
        second: ['brown', 'fox'], 
        third: ['jumped'], 
        fourth: ['over', 'the', 'lazy', 'dog']}
# Output each vowel from all strings

hsh.each do | _, arr |
  arr.each do | word |
    word.chars.each do | char |
      print char if char.match?(/[aeiou]/)
    end
  end
end
