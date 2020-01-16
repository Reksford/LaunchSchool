#require 'pry'
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----|-----|-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----|-----|-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
  
  def two_player_markers?(squares)
    squares.collect(&:marker).count(TTTGame::HUMAN_MARKER) == 2 &&
    squares.collect(&:marker).count(Square::INITIAL_MARKER) == 1
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end
  
  def block_key
    #returns a number or nil if there is no block
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if two_player_markers?(squares)
      #binding.pry
        return line[squares.index { |square| square.marker == Square::INITIAL_MARKER }]
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker
  attr_accessor :name

  def initialize(marker)
    @marker = marker
  end
end

class Score
  def initialize
    @human = 0
    @computer = 0
  end
  
  def human_wins
    @human += 1
  end
  
  def computer_wins
    @computer += 1
  end
  
  def to_s
    "Player: #{@human} | Computer: #{@computer}"
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  FIRST_TO_MOVE = HUMAN_MARKER
  attr_reader :board, :human, :computer, :score

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_turn = FIRST_TO_MOVE
    @score = Score.new
  end

  def play
    display_welcome_message
    set_name
    loop do
      display_board
      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_display_board if human_turn?
      end

      display_result
      update_score
      break unless play_again?
      reset
    end
    puts score
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Tic-Tac-Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic-Tac-Toe! Goodbye!"
  end

  def clear
    system 'cls'
  end

  def display_result
    clear_screen_display_board
    case board.winning_marker
    when HUMAN_MARKER
      puts "#{human.name} wins!"
    when COMPUTER_MARKER
      puts "Computer wins!"
    else
      puts "It's a tie!"
    end
  end
  
  def joinor (an_array, comma, word)
    string = ''
    an_array.each_with_index do |num, index|
      num = num.to_s
      if index == an_array.length - 1
        string += "#{word} #{num}"
      else
        string += "#{num}#{comma} "
      end
    end
    string
  end

  def display_board
    puts "#{human.name}, are #{human.marker}"
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_display_board
    clear
    display_board
  end
  
  def set_name
    puts "Please enter player name:"
    human.name = gets.chomp.capitalize
  end

  def human_turn?
    @current_turn == HUMAN_MARKER
  end
  
  def block_moves?
    !!board.block_key
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys, ",", "or")})"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Not a valid choice."
    end
    board[square] = human.marker
  end

  def computer_moves
    if block_moves?
      board[board.block_key] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_turn = COMPUTER_MARKER
    else
      computer_moves
      @current_turn = HUMAN_MARKER
    end
  end
  
  def update_score
    winner = board.winning_marker
    if winner == HUMAN_MARKER
      score.human_wins
    elsif winner == COMPUTER_MARKER
      score.computer_wins
    end      
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry you must answer 'y' or 'n'"
    end

    answer == 'y'
  end

  def reset
    board.reset
    @current_turn = FIRST_TO_MOVE
    clear
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
