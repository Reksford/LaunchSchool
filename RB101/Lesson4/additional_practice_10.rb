munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# Add additional trait age_group
# kid: 0 - 17, adult: 18 - 64, senior: 65+

munsters.each_pair do | name, traits|
  if traits["age"] < 18
    traits["age_group"] = "child"
  elsif (18..64).include?(traits["age"])
    traits["age_group"] = "adult"
  else
    traits["age_group"] = "senior"
  end
end

p munsters