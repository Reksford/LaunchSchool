require "pry"
PLAYER_HAND = []
DEALER_HAND = []

def initialize_deck
  new_deck = []
  cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :j, :q, :k, :a]
  cards.each do |card|
    4.times { new_deck.push(card) }
  end
  new_deck
end

def deal_a_card_to!(player_hand, deck)
  player_hand.push(deck.pop)
end
alias hit! deal_a_card_to!

def opening_deal!(deck)
  2.times do
    deal_a_card_to!(PLAYER_HAND, deck)
    deal_a_card_to!(DEALER_HAND, deck)
  end
end

def score(hand)
  total = 0
  hand.each do |card|
    if [:j, :q, :k].include?(card)
      total += 10
    elsif card == :a
      total += 11
    else
      total += card
    end
  end

  if total > 21
    hand.count(:a).times do
      total -= 10
      break if total <= 21
    end
  end
  total
end

def bust?(hand)
  score(hand) > 21 ? true : false
end

def display_hand(player)
  case player
  when 'player'
    puts "You have: #{PLAYER_HAND.join(' and ')} (#{score(PLAYER_HAND)})"
  when 'dealer'
    puts "Dealer has: #{DEALER_HAND.join(' and ')} (#{score(DEALER_HAND)})"
  when 'open'
    puts "The Dealer shows: #{DEALER_HAND[0]} and an unknown card."
  end
end

def display_winner
  if score(PLAYER_HAND) > score(DEALER_HAND)
    puts "You win!!!"
  elsif score(PLAYER_HAND) < score(DEALER_HAND)
    puts "The Dealer wins!"
  else
    puts "It's a tie!"
  end
end

puts "======TWENTY-ONE======"
# Main Gameplay Loop
loop do
  # Start Game
  deck = initialize_deck.shuffle
  opening_deal!(deck)

  loop do
    # Player turn
    display_hand('player')
    display_hand('open')
    loop do
      puts "hit or stay?"
      answer = gets.chomp
      break if answer.downcase == 'stay'
      hit!(PLAYER_HAND, deck)
      display_hand('player')
      break if bust?(PLAYER_HAND)
    end

    if bust?(PLAYER_HAND)
      puts "You went bust!"
      break
    else
      puts "You chose to stay."
      puts "You're current score is #{score(PLAYER_HAND)}"
    end
    # Dealer turn
    display_hand('dealer')
    loop do
      break if score(DEALER_HAND) >= 17 || bust?(DEALER_HAND)
      puts "Dealer hits!"
      hit!(DEALER_HAND, deck)
      display_hand('dealer')
    end

    if bust?(DEALER_HAND)
      puts "Dealer went bust!"
    else
      puts "Dealer stays."
    end
    break
  end

  # Compare Scores
  if bust?(PLAYER_HAND)
    display_hand('dealer')
    puts "The Dealer wins!"
  elsif bust?(DEALER_HAND)
    puts "You win!"
  else
    display_hand('player')
    display_hand('dealer')
    display_winner
  end

  PLAYER_HAND.clear
  DEALER_HAND.clear

  puts "Do you want to play again? (y, n)"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

puts "Thank you for playing!"
