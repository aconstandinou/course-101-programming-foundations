# MORTGAGE & CAR LOAN CALCULATOR

def prompt(message)
  Kernel.puts("=> #{message}")
end

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
