require "pry"
INITIAL = ' '
PLAYER = 'X'
COMPUTER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'cls'
  puts "You're a #{PLAYER}. Computer is #{COMPUTER}."
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def intialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL }
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

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd), ', ', 'or')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include? square
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER
end

def computer_places_piece!(brd)
  square = nil

  WINNING_LINES.each do |line|
    square = square_at_risk(brd, line, COMPUTER)
    square ||= square_at_risk(brd, line, PLAYER)
    break if square
  end


  if empty_squares(brd).include?(5)
    square = 5
  end

  square ||= empty_squares(brd).sample
  brd[square] = COMPUTER
end

def square_at_risk(brd, line, player)
  if brd.values_at(*line).count(player) == 2
    brd.select { |key, value| line.include?(key) && value == ' '}.keys.first
  end
end

def alternate_player(current_player)
  if current_player == 'Player'
    return 'Computer'
  else
    return 'Player'
  end
end

def places_piece!(brd, current_player)
  if current_player == 'Player'
    player_places_piece!(brd)
  else current_player == 'Computer'
    computer_places_piece!(brd)
  end
end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER) == 3
      return 'Computer'
    end
  end
  nil
end

score = {'Player' => 0, 'Computer' => 0}
loop do # Choose Player
  prompt "Do you want to play first or second?"
  current_player = ['Player', 'Computer'].sample
  answer = gets.chomp.downcase
  if answer.start_with?('f') || answer.to_i == 1
    current_player = 'Player'
  elsif answer.start_with?('s') || answer.to_i == 2
    current_player = 'Computer'
  end

  loop do # Start Game
    board = intialize_board

    loop do # Main Gameplay Loop
      display_board(board)
      places_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)
    winner = detect_winner(board)

    if someone_won?(board)
      prompt "#{winner} won!"
      score[winner] += 1
    else
      prompt "It's a tie!"
    end

    prompt "The #{score.key(5)} has won five games so far." if score.has_value?(5)
    prompt "Play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
  break
end

prompt "Thank you for playing TicTacToe!"
