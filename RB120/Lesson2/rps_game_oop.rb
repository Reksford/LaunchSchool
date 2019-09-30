module History
  attr_reader :history

  def add_to_history(move)
    @history.push(move)
  end
  
  def print_history
    puts @history.join(', ')
  end
end

module Logic
  # Keeps track of losses, if Computer loses twice in a row
  # it will not throw the same move twice.
  # Which is not good a.i. I just wanted to program something.
  def loses
    self.move.status = :lost
  end
  
  def lost_twice?
    self.history[-1].status == :lost && self.history[-2].status == :lost
  end
  
  def choose
    self.move = Move.new(Move::VALUES.sample)
    while (self.move.value == self.history[-1].value) do
      self.move = Move.new(Move::VALUES.sample)
    end
  end
end

class Player
  attr_accessor :move, :name, :score
  include History

  def initialize
    set_name
    @score = 0
    @history = []
  end
  
  def wins
    self.score += 1
  end
end

class Move
  attr_reader :value
  attr_accessor :status
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
    self.add_to_history(move)
  end
end

class Computer < Player
  include Logic

  def set_name
    self.name = %w(Robbit Settit Chompit Gradet).sample
  end

  def choose
    if history.size > 1 && lost_twice?
      super
    else
      self.move = Move.new(Move::VALUES.sample)
    end
      self.add_to_history(move)
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

  def display_winner(winner = false)
    if winner == human.name
      puts "#{human.name} wins!"
    elsif winner == computer.name
      puts "#{computer.name} wins."
    else
      puts "It's a tie!"
    end
  end
  
  def resolve_winner
    if human.move > computer.move
      human.wins
      computer.loses
      display_winner(human.name)
    elsif human.move < computer.move
      computer.wins
      display_winner(computer.name)
    else
      display_winner
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
      resolve_winner
      break unless play_again?
    end
    human.print_history
    display_goodbye_message
  end
end

RPSGame.new.play
