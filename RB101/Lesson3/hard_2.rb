greetings = { a: 'hi' }
informal_greeting = greetings[:a]
puts "greetings: #{greetings.object_id}"
puts "informal_greeting: #{informal_greeting.object_id}"
puts "greetings[:a]: #{greetings[:a].object_id}"
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # => { :a => "hi there" }