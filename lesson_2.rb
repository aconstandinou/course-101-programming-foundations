#Lesson 2: Small Programs

#Walk-Through Calculator

#pseudo code:
#ask user for two numbers
#ask user for type of operation
#perform calculation
#output result

Kernel.puts("Welcome to the Calculator!")
Kernel.puts("What is your first number?")
num1 = Kernel.gets().chomp()

Kernel.puts("What is your second number?")
num2 = Kernel.gets().chomp()

Kernel.puts("What operation do you want to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

if operator == '1'
  result = num1.to_i() + num2.to_i()
elsif operator == '2'
  result = num1.to_i() - num2.to_i()
elsif operator == '3'
  result = num1.to_i() * num2.to_i()
else
  result = num1.to_f() / num2.to_f()
end

puts("The result is #{result}")
