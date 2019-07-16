ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# Throw out anyone over 100
ages.delete_if { |name, age| age > 100 }
p ages

# ages.keep_if { |name, age| age < 100 }
