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

# Assignment: Mortgage / Car Loan Calculator

prompt("Welcome to the Mortgage/Car Loan Calculator")
prompt("Please input three pieces of information")
prompt("How much is the loan amount for? ex: 1000.00")
loan_amt = gets.chomp().to_f
prompt("What is the APR Annual Percentage Rate? Ex: 5% input as 0.05")
apr_rate = gets.chomp().to_f
prompt("What is the loan duration in years?")
loan_duration = gets.chomp().to_f

monthly_rate = apr_rate / 12
num_months = loan_duration * 12
monthly_interest = loan_amt *
                   (monthly_rate /
                   (1 - (1 + monthly_rate) ** -num_months))
monthly_pmt = monthly_interest + (loan_amt / num_months)
prompt("The monthly payment = #{monthly_pmt} for #{num_months} months.")
# format `#' for `f' forces to show the decimal point out to 2.
prompt("Your monthly payment is: $#{format('%02.2f', monthly_pmt)}")
