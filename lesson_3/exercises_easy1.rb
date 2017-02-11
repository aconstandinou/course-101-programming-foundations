# question 1
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
# uniq removes duplicates but does not mutate the caller
# original array is unchanged
# could use it as follows: new_numbers = numbers.uniq

# question 2
# 2.1: "!=" means does not equal and is used in conditionals
# 2.2: "!" before: used to turn any object into the opposite of their boolean equivalent, just like the above, but opposite.
# 2.3: "!" after something typically represents mutation/change/potentially dangerous change
# 2.4: "?" before: ternary operator for if..else
# 2.5: "?" after: checks for verification but depends on method used
# 2.6: "!!" before: used to turn any object into their boolean equivalent.

# question 3
advice = "Few things in life are as important as house training your pet dinosaur."
advice_array = advice.split(" ")
index_to_change = advice_array.index("important")
advice_array[index_to_change] = "urgent"
advice = advice_array.join(" ")
# solution provided by LS
advice2 = "Few things in life are as important as house training your pet dinosaur."
advice2.gsub!('important', 'urgent')

# question 4
# what is the difference between Array#delete and Array#delete_at ?
numbers = [1, 2, 3, 4, 5]
# deletes at the index & mutates
numbers.delete_at(1)
numbers = [1, 2, 3, 4, 5]
# deletes values in array equal to 1 & mutates
numbers.delete(1)

# question 5
# Programmatically determine if 42 lies between 10 and 100 by using Range
# create range and test for include? returns true or false
(10..100).cover?(42)

# question 6
# show two different ways to put the expected "Four score and " in front of it.

# method 1
famous_words = "seven years ago..."
famous_words.insert(0, "Four score and ")
puts famous_words
# method 2
famous_words = "seven years ago..."
famous_words[0,0] = "Four score and "
puts famous_words

# question 7
# friggin cool method. After we created a string that looks like a
# recursive method, it seems to have evaluated it as it was.
# meaning, it took a string of a recursive method, and ran it within itself

# question 8
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
# We will end up with this "nested" array
flintstones.flatten!

# question 9
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# Turn this into an array containing only two elements: Barney's name and Barney's number
flintstones.keep_if { |key, value| key == "Barney" }
flintstones.to_a.flatten!
