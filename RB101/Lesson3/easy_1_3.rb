advice = "Few things in life are as important as house training your pet dinosaur."
#Replace 'important' with 'urgent'

new_advice = advice.split(' ')
  .each {|word| word == 'important' ? word.replace('urgent') : word }
  .join(' ')
p new_advice

# advice.gsub!('important', 'urgent')
# p advice