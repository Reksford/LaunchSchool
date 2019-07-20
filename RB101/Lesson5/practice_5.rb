munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age_of_males = 0

munsters.each do |name, info|
  if info['gender'] == 'male'
    total_age_of_males += info['age']
  end
end

p total_age_of_males