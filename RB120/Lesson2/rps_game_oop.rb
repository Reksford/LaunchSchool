class Player
  attr_accessor :move, :name

  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
    set_name
  end
  
  def set_name
    if human?
      n = ""
      puts "What is your name?"
      loop do
        n = gets.chomp
        break unless n.empty?
      end
      self.name = n.capitalize
    else
      self.name = %w(Robbit Settit Chompit Gradet).sample
    end
  end
  
  def choose
    if human?
      puts "Choose rock, paper, or scissors:"
      choice = nil
      loop do
        choice = gets.chomp
        break if %w(rock paper scissors).include?(choice)
        puts "Invalid move, try again."
      end
        self.move = choice
    else
      self.move = %w(rock paper scissors).sample
    end
  end
  
  def human?
    @player_type == :human
  end
end

class Move
  def initialize
  
  end
end

class Rule
  def initialize
  
  end
end

def compare(move1, move2)

end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new(:computer)
  end
  
  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end
  
  def display_goodbye_message
    puts "Thank You for Playing!"
  end
  
  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name}, the computer, chose #{computer.move}."
  
    case human.move
    when 'rock'
      puts "#{human.name} wins!" if computer.move == 'scissors'
      puts "It's a tie!" if computer.move == 'rock'
      puts "#{computer.name} wins." if computer.move == 'paper'
    when 'paper'
      puts "#{human.name} wins!" if computer.move == 'rock'
      puts "It's a tie!" if computer.move == 'paper'
      puts "#{computer.name} wins." if computer.move == 'scissors'
    when 'scissors'
      puts "#{human.name} wins!" if computer.move == 'paper'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "#{computer.name} wins." if computer.move == 'rock'
    end
  end
  
  def play_again?
    puts "Do you want to play again? (y/n)"
    answer = gets.chomp.downcase
    return true if answer.start_with?('y')
    return false
  end
  
  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play