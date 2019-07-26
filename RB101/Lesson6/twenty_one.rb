require "pry"
PLAYER_HAND = []
DEALER_HAND = []

def initialize_deck
  new_deck = []
  cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :j, :q, :k, :a]
  cards.each do |card|
     4.times { new_deck.push(card) }
  end
  return new_deck
end

def deal_a_card_to!(player, deck)
  player.push(deck.pop)
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
  return total
end

def bust?(hand)
  true if score(hand) > 21
end

# Start Game
deck = initialize_deck.shuffle
opening_deal!(deck)

# Player turn

# Dealer turn

# Compare Scores
