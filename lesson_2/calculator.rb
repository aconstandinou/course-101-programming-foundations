# Lesson 2: Small Programs

# Walk-Through Calculator

# pseudo code:
# ask user for two numbers
# ask user for type of operation
# perform calculation
# output result

# REFACTORING CALCULATOR
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

num1 = '' # initialize num1 variable outside the loop (scope)
num2 = '' # initialize num1 variable outside the loop (scope)
operator = '' # initialize num1 variable outside the loop (scope)

prompt("Welcome to the Calculator! Enter your name:")
name = ''

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

loop do # main loop
  loop do
    prompt("What is your first number?")
    num1 = Kernel.gets().chomp()
    if valid_number?(num1)
      break
    else
      prompt("Error, please input a valid number")
    end
  end

  loop do
    prompt("What is your second number?")
    num2 = Kernel.gets().chomp()
    if valid_number?(num2)
      break
    else
      prompt("Error, please input a valid number")
    end
  end

  operator_prompt = <<-message
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) division
  message

  prompt(operator_prompt)
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             num1.to_i() + num2.to_i()
           when '2'
             num1.to_i() - num2.to_i()
           when '3'
             num1.to_i() * num2.to_i()
           when '4'
             num1.to_f() / num2.to_f()
           end
  prompt("The result is #{result}")
  prompt("Do you want to perform an another calculation?
  (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y') # dont break if starts w/ y
end
prompt("See ya later.")
