VALID_CHOICES = %w(rock paper scissors lizard spock)

WIN_CONDITIONS = {
                  'rock' => ['lizard', 'scissors'],
                  'paper' => ['rock', 'spock'],
                  'scissors' => ['paper', 'lizard'],
                  'lizard' => ['spock', 'paper'],
                  'spock' => ['scissors', 'rock']
}

def prompt(message)
  puts("=> #{message}")
end

def win?(win, loss)
  WIN_CONDITIONS[win].include?(loss)
end

def display_result(player, computer)
  if player == computer
    prompt("It's a tie!")
  elsif win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("The computer won.")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.downcase
    
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")
  display_result(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing!")
