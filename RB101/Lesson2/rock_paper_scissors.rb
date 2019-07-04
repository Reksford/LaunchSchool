require "pry"

VALID_CHOICES = %w(rock paper scissors lizard spock)

WIN_CONDITIONS = {
                  'rock' => ['lizard', 'scissors'],
                  'paper' => ['rock', 'spock'],
                  'scissors' => ['paper', 'lizard'],
                  'lizard' => ['spock', 'paper'],
                  'spock' => ['scissors', 'rock']
}

SCORE = {
          player: 0,
          computer: 0
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




def reset()
  SCORE[:player] = 0
  SCORE[:computer] = 0
end


def increment_winner(player, computer)
  if win?(player, computer)
    SCORE[:player] += 1
  elsif win?(computer, player)
    SCORE[:computer] += 1
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
  increment_winner(choice, computer_choice)
  
  if SCORE.any? {|_, scores| scores >= 5}
    if SCORE[:player] == 5
      prompt("You are the grand winner!")
    else
      prompt("The computer is the grand winner.")
    end
    prompt("Would you like to reset the game?")
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
    reset
    next
  end
  
  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing!")
