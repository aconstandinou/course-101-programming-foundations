# rock, paper, scissors, lizard, spock
VALID_CHOICES = %w(r p sc l sp)
player_score = 0
computer_score = 0

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'r' && second == 'sc') ||
    (first == 'p' && second == 'r') ||
    (first == 'sc' && second == 'p') ||
    (first == 'r' && second == 'l') ||
    (first == 'l' && second == 'sp') ||
    (first == 'sp' && second == 'sc') ||
    (first == 'sc' && second == 'l') ||
    (first == 'l' && second == 'p') ||
    (first == 'p' && second == 'sp') ||
    (first == 'sp' && second == 'r')
end

def display_results(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "Computer won!"
  else
    "It's a tie."
  end
end

loop do
  # needs to be initialized outside of the loop so that we may use it
  choice = ''
  loop do
    prompt("Choose one: rock(r) paper(p) scissors(sc) lizard(l) spock(sp)")
    choice = Kernel.gets().chomp()
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  computer_choice = VALID_CHOICES.sample
  prompt("You chose #{choice}, and computer chose #{computer_choice}.")
  x = display_results(choice, computer_choice)
  puts x
  if x == "You won!"
    player_score += 1
  elsif x == "Computer won!"
    computer_score += 1
  end
  prompt("Your score is #{player_score} and computer #{computer_score}.")
  if player_score == 5 || computer_score == 5
    if player_score == 5
      prompt("You won the match!")
      break
    elsif computer_score == "Computer won!"
      prompt("Computer won the match!")
      break
    end
  end
end
prompt("Thank you for playing. Goodbye")
