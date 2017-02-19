# exercises: methods and more methods
# exercise 1
# A: performs selection based on the truthiness of the block's return value.
# In this case the return value will always be 'hi', which is a "truthy" value.
# Therefore select will return a new array containing all of the elements in
# the original array.

# exercise 2
# A: we can find out how count treat's the block return via the
# Enumerable#count Documentation
# Returns the number of items yielding a true value, if a block is given
# LS: Based on this information, we can conclude that count only counts an
# element if the block's return value evaluates to true. This means that count
# considers the truthiness of the block's return value.

# exercise 3
# A: Since puts always returns nil, you might think that no values would be
# selected and an empty array would be returned. The important thing to be
# aware of here is how reject treats the return value of the block. reject
# returns a new array containing items where the block's return value is
# "falsey". In other words, if the return value was false or nil the element
# would be selected

# Additional exercises

# Exercise 5
# In the array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"
name_array = flintstones.select do |name|
  /Be/.match(name)
end
first_occurence = flintstones.index(name_array[0])
# LS answer
flintstones.index { |name| name[0, 2] == "Be" }

# Exercise 6
# USE MAP
# Amend this array so that the names are all shortened to just the first
# three characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! do |name|
  name = name[0,3]
end

# Exercise 7
# Create a hash that expresses the frequency with which each letter
# occurs in this string:
statement = "The Flintstones Rock"
string_to_count = statement.split('')
counts = Hash.new(0)
string_to_count.each do |char|
  counts[char] += 1
end
# LS version
statement = "The Flintstones Rock"
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

# Exercise 9
words = "the flintstones rock"
words_array = words.split(' ')
words_array = words_array.each do |word|
  word = word.capitalize!
end
words_array

# LS
words.split.map { |word| word.capitalize }.join(' ')

# Exercise 10
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  age_group = ''
  value.each do |k, v|
    if k == 'age'
      if v < 18
        age_group = 'kid'
      elsif v >= 18 && v < 65
        age_group = 'adult'
      else
        age_group = 'senior'
      end
    end
  end
  munsters[key].merge!({"age_group" => age_group})
  munsters
end

# LS answer
munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
