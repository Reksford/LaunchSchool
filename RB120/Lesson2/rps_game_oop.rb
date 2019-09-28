class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
  
  def wins
    self.score += 1
  end
end

class Move
  attr_reader :value
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def rock?
    value == 'rock'
  end

  def paper?
    value == 'paper'
  end

  def scissors?
    value == 'scissors'
  end

  def >(other_value)
    (rock? && other_value.scissors?) ||
      (paper? && other_value.rock?) ||
      (scissors? && other_value.paper?)
  end

  def <(other_value)
    (rock? && other_value.paper?) ||
      (paper? && other_value.scissors?) ||
      (scissors? && other_value.rock?)
  end

  def to_s
    @value
  end
end

class Human < Player
  def set_name
    n = ""
    puts "What is your name?"
    loop do
      n = gets.chomp
      break unless n.empty?
    end
    self.name = n.capitalize
  end

  def choose
    puts "Choose rock, paper, or scissors:"
    choice = nil
    loop do
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Invalid move, try again."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = %w(Robbit Settit Chompit Gradet).sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thank You for Playing!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name}, the computer, chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} wins!"
    elsif human.move < computer.move
      puts "#{computer.name} wins."
    else
      puts "It's a tie!"
    end
  end
  
  def add_score
    if human.move > computer.move
      human.wins
    elsif human.move < computer.move
      computer.wins
    end
  end

  def play_again?
    puts "Do you want to play again? (y/n)"
    answer = gets.chomp.downcase
    return false unless answer.start_with?('y')
    true
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      add_score
        puts "#{human.name}: #{human.score} -- #{computer.name}: #{computer.score}"
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
