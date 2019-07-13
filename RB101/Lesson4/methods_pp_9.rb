{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
# => [nil, "bear"]
# map here is returning the value if the length of the value is
# greater than three. This if statement doesn't have any else clauses
# and so if returns nil when a value doesn't pass.