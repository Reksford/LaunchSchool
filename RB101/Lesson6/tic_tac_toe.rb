require "pry"
INITIAL = ' '
PLAYER = 'X'
COMPUTER = 'O'

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

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{empty_squares(brd).join(', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include? square
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER
end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                [1, 4, 7], [2, 5, 8], [3, 6, 9],
                [1, 5, 9], [3, 5, 7]]
  winning_lines.each do |line|
    if brd[line[0]] == PLAYER &&
       brd[line[1]] == PLAYER &&
       brd[line[2]] == PLAYER
      return 'Player'
    elsif brd[line[0]] == COMPUTER &&
       brd[line[1]] == COMPUTER &&
       brd[line[2]] == COMPUTER
      return 'Computer'
    end
  end
  nil
end

loop do
  board = intialize_board

  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing TicTacToe!"
