require 'pry'

DECK_VALUES = { "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7,
                "8" => 8, "9" => 9, "10" => 10, "jack" => 10, "queen" => 10,
                "king" => 10 }
ONE_ACE = 11
TWO_ACES = 12
THREE_ACES = 13
FOUR_ACES = 14
TWENTY_ONE = 21

def prompt(msg)
  puts "=> #{msg}"
end

# INITIALIZE A NEW DECK
def deck_initialize
  { "2" => 4, "3" => 4, "4" => 4, "5" => 4, "6" => 4, "7" => 4,
    "8" => 4, "9" => 4, "10" => 4, "jack" => 4, "queen" => 4,
    "king" => 4, "ace" => 4 }
end

# UPDATE OUR DECK AS WE DRAW OUT CARDS
def current_deck_update!(cards, hash)
  cards.each do |card|
    hash[card] -= 1
  end
  hash
end

def deal_cards(array, hash)
  array.push(hash.keys.sample)
  array.push(hash.keys.sample)
  array
end

def calculate_ace(array)
  # first find current value of cards without the ace
  current_value = 0
  array.each do |card|
    next if card == "ace"
    current_value += DECK_VALUES[card]
  end

  # second find current value of cards with ace(s)
  ace_array_one = [1, 1, 1, 1] # no two aces can both be worth 11
  ace_array_eleven = [11, 1, 1, 1] # if we exceed 21, our aces can only be 1
  ace_count = array.count("ace")

  if ace_count == 1 # one ace
    if (current_value + ONE_ACE) > TWENTY_ONE
      current_value + ace_array_one.values_at(0).inject(0, :+)
    else
      current_value + ace_array_eleven.values_at(0).inject(0, :+)
    end
  elsif ace_count == 2 # two aces
    if (current_value + TWO_ACES) > TWENTY_ONE
      current_value + ace_array_one.values_at(0, 1).inject(0, :+)
    else
      current_value + ace_array_eleven.values_at(0, 1).inject(0, :+)
    end
  elsif ace_count == 3 # three aces
    if (current_value + THREE_ACES) > TWENTY_ONE
      current_value + ace_array_one.values_at(0, 1, 2).inject(0, :+)
    else
      current_value + ace_array_eleven.values_at(0, 1, 2).inject(0, :+)
    end
  else # four aces
    if (current_value + FOUR_ACES) > TWENTY_ONE
      current_value + ace_array_one.inject(0, :+)
    else
      current_value + ace_array_eleven.inject(0, :+)
    end
  end
end

def hand_value(array)
  total_value = 0
  if array.count("ace") == 0
    array.each do |card|
      total_value += DECK_VALUES[card]
    end
  else
    total_value = calculate_ace(array)
  end
  total_value
end

def start_game
  deck_hash = deck_initialize
  pl_cards = []
  dlr_cards = []
  pl_cards = deal_cards(pl_cards, deck_hash)
  deck_hash = current_deck_update!(pl_cards, deck_hash)
  dlr_cards = deal_cards(dlr_cards, deck_hash)
  deck_hash = current_deck_update!(dlr_cards, deck_hash)
  prompt "Dealer has: #{dlr_cards[0]} and unknown card"
  prompt "You have: #{pl_cards[0]} and #{pl_cards[1]}"
  return deck_hash, pl_cards, dlr_cards
end

def hit!(cards, hash)
  hash.delete_if { |_, value| value == 0 }
  cards.push(hash.keys.sample)
  hash = current_deck_update!([cards[-1]], hash)
  return cards, hash
end

def busted?(cards_array)
  hand_value = hand_value(cards_array)
  if hand_value > TWENTY_ONE
    true
  else
    false
  end
end

def winner?(pl_cards, dlr_cards)
  player_value = hand_value(pl_cards)
  dealer_value = hand_value(dlr_cards)
  winner = ""
  if player_value == dealer_value
    prompt "It's a tie."
    winner = nil
  elsif player_value > dealer_value && player_value <= TWENTY_ONE
    prompt "Player Won!"
    winner = "Player"
  elsif player_value < dealer_value && dealer_value > TWENTY_ONE
    prompt "Player Won!"
    winner = "Player"
  else
    prompt "Dealer Won."
    winner = "Dealer"
  end
  winner
end

def score_to_5?(score_tracker)
  if score_tracker['Player'] >= 5 || score_tracker['Dealer'] >= 5
    true
  else
    false
  end
end

def display_score(hash)
  prompt("Scores: Player #{hash['Player']} - Dealer #{hash['Dealer']}.")
end

loop do
  score_tracker = { 'Player' => 0, 'Dealer' => 0 }
  loop do
    loop do
      prompt "======================="
      display_score(score_tracker)
      deck_hash, pl_cards, dlr_cards = start_game # start our game
      busted = false
      loop do
        puts "(h)it or (s)tay?"
        answer = gets.chomp.downcase
        break if ['s'].include?(answer)
        if answer == 'h'
          pl_cards, deck_hash = hit!(pl_cards, deck_hash)
          busted = busted?(pl_cards)
          prompt "You have: #{pl_cards.join(' ')}"
        end
        if busted
          score_tracker["Dealer"] += 1
          break
        end
      end

      if busted
        prompt "You Busted!!!!"
        break
      else
        prompt "You chose to stay."
        prompt "Dealers turn."

        loop do
          break if hand_value(dlr_cards) > 17
          dlr_cards, deck_hash = hit!(dlr_cards, deck_hash)
        end

        prompt "You have: #{pl_cards.join(' ')} for #{hand_value(pl_cards)}"
        prompt "Dealer has: #{dlr_cards.join(' ')} for #{hand_value(dlr_cards)}"
        winner = winner?(pl_cards, dlr_cards)
        if winner
          score_tracker[winner] += 1
        end
      end
      sleep(2)
    end
    break if score_to_5?(score_tracker)
  end
  prompt "Do you want to play again?"
  answer_to_play = gets.chomp
  break unless answer_to_play.downcase.start_with?('y')
end

prompt "Thanks for playing 21. Good bye!"
