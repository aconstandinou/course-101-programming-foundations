# rubocop: rock, paper, scissors.
VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
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
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
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
  prompt("Do you want to play again? Y or N")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
prompt("Thank you for playing. Goodbye")
