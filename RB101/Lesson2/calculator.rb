require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(str)
  case str
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(MESSAGES['welcome'])
prompt(MESSAGES['ask_name'])

name = ''
loop do
  name = gets.chomp
  
  if name.empty?
    prompt(MESSAGES['invalid_name'])
  else
    break
  end
end

prompt("Hello #{name}!")

#Main calculator loop
loop do
  number_1 = ''
  number_2 = ''

  loop do
    prompt(MESSAGES['ask_first_number'])
    number_1 = gets.chomp
    
    if valid_number?(number_1)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  loop do
    prompt(MESSAGES['ask_second_number'])
    number_2 = gets.chomp

    if valid_number?(number_2)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end
  
  operator_prompt = <<-MSG
  What operation would you like to perform?
    1) add 
    2) subtract 
    3) multiply 
    4) divide
  MSG
  
  prompt(operator_prompt)
  
  operator = ''
  
  loop do
    operator = gets.chomp
    
    if %w(1 2 3 4).include? operator
      break
    else
      prompt(MESSAGES['invalid_operation'])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             result = number_1.to_i + number_2.to_i
           when '2'
             result = number_1.to_i - number_2.to_i
           when '3'
             result = number_1.to_i * number_2.to_i
           when '4'
             result = number_1.to_f / number_2.to_f
  end

  prompt("The result it #{result}")

  prompt(MESSAGES['repeat'])
  answer = gets.chomp.upcase
  break unless answer.start_with?'Y'
end

prompt(MESSAGES['goodbye'])