# question 1
string_to_print = "The Flintstones Rock!"
10.times do |i|
  puts (" "*i) + string_to_print
end

# Bonus: what if halfway through loop you wanted the space to come back in?
string_to_print = "The Flintstones Rock!"
j = 0
50.times do |i|
  if i < 25
    puts (" "*i) + string_to_print
  else
    j += 2
    puts (" "*(i-j)) + string_to_print
  end
end

# question 2
# A: error is due to trying to add a string and integer together
# Solutions
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"

# question 3

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

# Bonus 1: using modulo operation to verify factors of a given numbers
# Bonus 2: the last line is returned to return divisors array

# question 4
# A: there is a difference. rolling_buffer1 mutates the caller
#    whereas rolling_buffer2 does not. So when buffer is returned it won't
#    include the added elements as it is intended to do

# question 5
# the local variable limit is not included in the method scope
# if it was a conditional block or loop, it would be accessible to the inner
# scope. But since its a method, limit is not defined and either needs to be
# included as an input into the method, or a constant variable within the method

# question 6

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# question 7
# output 34

# question 8
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["gender"] = family_member["gender"].capitalize
  end
end

mess_with_demographics(munsters)

# question 9
# result will be "paper"

# question 10
# foo will always return "yes"
# when used as a variable for bar() method, it checks if its equal to "no"
# after the ? if its true it returns "yes" if false returns "no"
# since its false it returns "no"

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo)
