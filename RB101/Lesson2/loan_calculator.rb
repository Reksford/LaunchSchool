# Create Methods

def total_valid?(number)
  # Expecting large numbers to be entered with commas like 1,000,000
  # so trims commas to avoid things like '1,000,000'.to_i == 1
  if number.include?(",")
    number = number.delete(",")
  end
  return number.to_i unless number.to_i == 0
end

def get_monthly_interest(apr)
  # Expection a user input like '7%'
  interest = (apr.to_f / 100) / 12
  return interest unless interest == 0.0
end

def duration_in_months(years)
  months = years.to_i * 12
  return months unless months == 0
end

def monthly_payments(amount, interest, time)
  payment = amount * (interest / (1 - (1 + interest)**(-time)))
  payment
end

welcome = <<-EOS
Welcome to the mortgage/loan calculator!
Please tell me more about your loan.
I'll need the amount of the loan along with the APR and duration.
EOS

puts welcome

# Start main program loop. Restarts if
# total_valid?, get_monthly_interest, or duration_in_months return nil
loop do
  puts "How much is the total of your loan?"

  total_loan = gets.chomp

  puts "What is your APR?"

  annual_interest = gets.chomp

  puts "Lastly, how many years is the loan for?"

  years = gets.chomp

  total = total_valid?(total_loan)
  monthly_interest = get_monthly_interest(annual_interest)
  months = duration_in_months(years)

  if total && monthly_interest && months
    payment = monthly_payments(total, monthly_interest, months)
    puts "Your monthly payment will be: $#{payment.ceil(2)}"
    break
  else
    puts "Some of your inputs didn't make sense."
    puts "Need to have the Loan Amount, APR, and Years"
  end
end
