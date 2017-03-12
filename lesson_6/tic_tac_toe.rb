require 'pry'

FIRST_MOVE = ['player', 'computer', 'choose']
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[2, 5, 8], [1, 4, 7], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]] # diagonals


def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  # brd passed in is a hash so we can access keys and elements
  system 'cls'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts ""
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

# rubocop:enable Metrics/AbcSize

def initialize_board
  # creates a new board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  # checks to see if its empty
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

# for a method to modify a local variable (ie: board) we need to pass it in as
# an element into our method.

def joinor(array, delim = ', ', ending = 'or')
  if array.length == 1
    return array[0]
  elsif array.length == 2
    return array.join(' ' + ending + ' ')
  else
    return array.join(delim).insert(-2,ending+' ')
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    string_brd_options = joinor(empty_squares(brd))
    prompt "Choose a square #{joinor(empty_squares(brd))}:"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    if brd[5] == INITIAL_MARKER
      square = 5
    end
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  # if empty_squares is empty, we reached the end
  empty_squares(brd).empty?
end

def someone_won?(brd)
  # bang bang symbols return a boolean
  !!detect_winner(brd)
end

def detect_winner(brd)
  # can refactor and use value_at method for hashes
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def track_winner(round_winner, score_tracker)
  if round_winner == 'Player'
    score_tracker['Player'] += 1
  else
    score_tracker['Computer'] += 1
  end
  score_tracker # returns a hash
end

def display_score(hash)
  prompt("Scores: Player #{hash['Player']} - Computer #{hash['Computer']}.")
end

def score_to_5?(score_tracker)
  if score_tracker['Player'] >= 5 || score_tracker['Computer'] >= 5
    true
  else
    false
  end
end

def place_piece!(board, current_player)
  if current_player == "Player"
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def alternate_player(current_player)
  if current_player == "Computer"
    current_player = "Player"
  else
    current_player = "Computer"
  end
  current_player
end

loop do
  score_tracker = { 'Player' => 0,'Computer' => 0 }

  first_mover = FIRST_MOVE.sample

  if first_mover == 'choose'
    loop do
      prompt "Please choose someone to start: Player or Computer"
      first_mover = gets.chomp.capitalize
      break if first_mover == "Player" || first_mover == "Computer"
      prompt "Invalid choice"
    end
  end

  current_player = first_mover.capitalize

  loop do
    board = initialize_board

    loop do
      display_board(board)
      display_score(score_tracker)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      score_tracker = track_winner(detect_winner(board), score_tracker)
      sleep(2)
      display_board(board)
      break if score_to_5?(score_tracker)
    else
      prompt "It's a tie!"
      sleep(2)
      display_board(board)
    end
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')

end
prompt "Thanks for playing tic tac toe. Good bye!"
