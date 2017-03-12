INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
FIRST_PLAYER = 'player'

WINNING_COMBO = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def show_brd(moves, player, computer)
  system 'clear'
  puts "SCORE:\n" \
       "Player(X): #{player} | Computer(O): #{computer}"
  puts ""
  puts "     |     |"
  puts "  #{moves[1]}  |  #{moves[2]}  |  #{moves[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{moves[4]}  |  #{moves[5]}  |  #{moves[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{moves[7]}  |  #{moves[8]}  |  #{moves[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board
  new_board = Hash.new
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def joiner(list, delimiter=', ', word='or')
  case list.size
  when 0 then ''
  when 1 then list.first
  when 2 then list.join(" #{word} ")
  else
    list[-1] = "#{word} #{list.last}"
    list.join(delimiter)
  end
end

def player_place_marker!(board)
  player_choice = ''
  loop do
    prompt("Please choose a square: #{joiner(empty_squares(board))}.")
    player_choice = gets.to_i
    break if empty_squares(board).include?(player_choice)

    puts "Sorry, that's not a valid choice."
  end
  board[player_choice] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  square = board.select do |k, v|
    line.include?(k) && v == INITIAL_MARKER
  end
  square = square.keys.first
  return square if board.values_at(*line).count(marker) == 2
end

def computer_find_move(board, marker)
  computer_choice = nil
  WINNING_COMBO.each do |line|
    computer_choice = find_at_risk_square(line, board, marker)
    break if computer_choice
  end
  computer_choice
end

def computer_place_marker!(board)
  computer_choice = computer_find_move(board, COMPUTER_MARKER)

  computer_choice ||= computer_find_move(board, PLAYER_MARKER)

  computer_choice = 5 if !computer_choice && board[5] == ' '

  computer_choice = empty_squares(board).sample unless computer_choice

  board[computer_choice] = COMPUTER_MARKER
end

def make_a_move(player, board)
  if player == 1
    player_place_marker!(board)
  else
    computer_place_marker!(board)
  end
end

def player_order!(player_list)
  if FIRST_PLAYER == 'choose'
    puts "Enter a number for the first player: Player = 1 | computer = 2"
    player = gets.to_i
    if player == 2
      player_list.rotate!(1)
    end
  elsif FIRST_PLAYER == 'computer'
    player_list.rotate!(1)
  end
end

def display_winner(board)
  puts "Player won!" if find_winner(board) == :player
  puts "Computer won!" if find_winner(board) == :computer
  puts "It was a tie!" unless find_winner(board)
end

def find_winner(board)
  WINNING_COMBO.each do |combo|
    return :player if board.values_at(*combo).count('X') == 3
    return :computer if board.values_at(*combo).count('O') == 3
  end
  nil
end

def board_full?(board)
  empty_squares(board).empty?
end

def player_won?(board)
  !!find_winner(board)
end

loop do
  computer_score = 0
  player_score = 0

  loop do
    board = initialize_board
    player_order_list = [1, 2]
    player_order!(player_order_list)

    loop do
      show_brd(board, player_score, computer_score)
      make_a_move(player_order_list[0], board)
      player_order_list.rotate!
      break if player_won?(board) || board_full?(board)
    end

    show_brd(board, player_score, computer_score)
    if find_winner(board) == :player
      player_score += 1
    elsif find_winner(board) == :computer
      computer_score += 1
    end

    break puts display_winner(board) if player_score == 5 || computer_score == 5
  end

  prompt("Would you like to play again? (Y/N)")
  play_again = gets.chomp.downcase
  break if play_again == 'n'
end

puts "Thank you for playing. Good bye!"
