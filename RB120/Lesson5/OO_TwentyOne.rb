class Participant
  attr_reader :hand, :name

  def initialize
    @hand = []
  end

  def takes(card)
    @hand.push(card)
  end

  def clear_hand
    hand.clear
  end

  def show_hand
    puts "#{name}'s Hand"
    puts @hand.join(", ")
    puts "Total: #{score}"
    puts "--------------------------------"
  end

  def score
    total = 0
    hand.each do |card|
      if card.ace?
        total += 11
      elsif card.jack? || card.queen? || card.king?
        total += 10
      else
        total += card.rank.to_i
      end
    end
    # Check Aces
    hand.select(&:ace?).count.times do
      break if total <= 21
      total -= 10
    end
    total
  end

  def bust?
    score > 21
  end
end

class Player < Participant
  def initialize
    @name = "Player"
    super
  end
end

class Dealer < Participant
  def initialize
    @name = "Dealer"
    super
  end

  def show_dealer_hand
    puts "\n#{name} shows:"
    puts "One card facedown and " + @hand[1..-1].join(", ")
    puts "--------------------------------"
  end
end

class Deck
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
  SUITS = [:clubs, :diamonds, :hearts, :spades]
  attr_reader :cards

  def initialize
    @cards = fill_deck
  end

  def fill_deck
    new_deck = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        new_deck.push(Card.new(rank, suit))
      end
    end
    new_deck
  end

  def shuffle!
    @cards = @cards.shuffle.shuffle
  end

  def deal
    @cards.pop
  end
end

class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @suit = suit
    @rank = rank
  end

  def to_s
    "#{@rank} of #{@suit}"
  end

  def jack?
    rank == :jack
  end

  def queen?
    rank == :queen
  end

  def king?
    rank == :king
  end

  def ace?
    rank == :ace
  end
end

class Game
  attr_reader :deck, :player, :dealer

  def initialize
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    loop do
      new_deck
      deal_cards
      dealer.show_dealer_hand
      player_turn
      dealer_turn
      show_result
      break unless play_again?
      reset_hands
    end
  end

  def new_deck
    @deck = Deck.new
    deck.shuffle!
  end

  def reset_hands
    player.clear_hand
    dealer.clear_hand
  end

  def deal_cards
    2.times do
      player.takes(deck.deal)
      dealer.takes(deck.deal)
    end
  end

  def show_initial_cards
    player.show_hand
    dealer.show_dealer_hand
  end

  def player_turn
    loop do
      player.show_hand
      break if player.bust?
      puts "Do you want to Stay or Hit?"
      answer = gets.chomp.upcase
      break if answer.start_with?("S")
      if answer.start_with?("H")
        player.takes(deck.deal)
      else
        puts "Must choose either to (S)tay or (H)it."
      end
    end
  end

  def dealer_turn
    loop do
      if dealer.score > player.score || dealer.score >= 17
        puts "Dealer stays"
        break
      else
        puts "Dealer hits"
        dealer.takes(deck.deal)
      end
    end
  end

  def show_result
    player.show_hand
    dealer.show_hand
    if player.bust?
      puts "You bust, the Dealer wins!"
    elsif dealer.bust?
      puts "The Dealer bust, you win!"
    elsif player.score >= dealer.score
      puts "You win!"
    elsif dealer.score > player.score
      puts "The Dealer wins!"
    end
  end

  def play_again?
    puts "Do you want to play again?"
    answer = gets.chomp.upcase
    answer.start_with?("Y")
  end
end

game = Game.new
game.start
