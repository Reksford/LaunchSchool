hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
# Return an array containing the colors of the fruits and the sizes of the vegetables.

colors_sizes = hsh.map do |food, info|
  if info[:type] == 'fruit'
    info[:colors].map do |color|
      color.capitalize
    end
  else
    info[:size].upcase
  end
end

p colors_sizes