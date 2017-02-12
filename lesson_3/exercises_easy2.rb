# question 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# see if "Spot" is present.
ages.has_key?("Spot")
# two other ways?
ages.member?("Spot")
ages.include?("Spot")

# question 2
munsters_description = "The Munsters are creepy in a good way."
# Change 1: "The munsters are creepy in a good way."
munsters_description.capitalize!

# Change 2: "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.swapcase!

# Change 3: "the munsters are creepy in a good way."
munsters_description.downcase!

# Change 4: "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.upcase!

# question 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
# add ages for Marilyn and Spot to the existing hash
ages.merge!(additional_ages)

# question 4
advice = "Few things in life are as important as house training your pet dinosaur."
# See if the name "Dino" appears in the string below
advice.include?("Dino")
# LS solution
advice.match("Dino")

# question 5
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# question 6
# How can we add the family pet "Dino" to our usual array
flintstones << "Dino"

# question 7
flintstones.push("Dino", "Hoppy")

# question 8
advice = "Few things in life are as important as house training your pet dinosaur."
# ...remove everything starting from "house".
advice.slice!(0..38)

# LS solution
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0, advice.index('house'))

# question 9
statement = "The Flintstones Rock!"
# Write a one-liner to count the number of lower-case 't' characters in the following string
statement.count('t')

# LS solution
statement.scan('t').count

# question 10
title = "Flintstone Family Members"
title.center(40)
