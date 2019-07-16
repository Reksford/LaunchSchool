flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Shorten names to just the first three characters
flintstones.each do |name|
  name.slice!(3..name.size)
end
p flintstones

# flintstones.map! { |name| name[0,3] }
# For some reason I always forget about using #map and #map!