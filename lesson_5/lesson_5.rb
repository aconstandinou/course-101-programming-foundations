# lesson 5 Exercises:
# Sorting, Nested Collections and Working with Blocks

# Exercise 1
# How would you order this array of number strings by descending numeric value?
arr = ['10', '11', '9', '7', '8']
arr.sort do |ele1, ele2|
  ele2.to_i <=> ele1.to_i
end

# Exercise 2
# How would you order this array of hashes based on the year of publication of
# each book, from the earliest to the latest?
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

x = books.sort_by { |key| key[:published].to_i  }
p x

# Exercise 3
# For each of these collection objects demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][-1][-1]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr2[-1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[-1][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].keys

# Exercise 4
# For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.
arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[-1] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][-1] = 4


# Exercise 5
# figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
total_age_male = 0

munsters.each do |key, value|
  if value["gender"] == "male"
    total_age_male += value["age"]
  end
end

# Exercise 6
# print out the name, age and gender of each family member
# Like this:
# (Name) is a (age) year old (male or female).

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
munsters.each do |key, value|
  puts "#{key} is a #{value["age"]} year old #{value["gender"]}"
end

# Exercise 8
# Using the each method, write some code to output all of the vowels from the strings.
hsh = {
  first: ['the', 'quick'],
  second: ['brown', 'fox'],
  third: ['jumped'],
  fourth: ['over', 'the', 'lazy', 'dog']
}

list_of_vowels = ['a','e','i','o','u']

hsh.each do |key, value|
  value.each do |word|
    letter_split = word.split(//)
      letter_split.each do |char|
        puts char if list_of_vowels.include?(char)
      end
  end
end

# Exercise 9
# Given this data structure, return a new array of the same structure but with
# the sub arrays being ordered (alphabetically or numerically as appropriate)
# in descending order.
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
arr.map do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end

# Exercise 10
# Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure to the
# original but where the value of each integer is incremented by 1.

array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

array.map do |element|
  element.map { |key, value| {key.to_sym => value + 1}  }
end

# LS version
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end


# Exercise 11

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# Given the following data structure use a combination of methods, including
# either the select or reject method, to return a new array identical in
# structure to the orig but containing only the ints that are multiples of 3.

arr.map do |array|
  array.each do |num|
    if num % 3 == 0
      num
    else
      nil
    end
  end
end

# Exercise 12

hash = {}
arr.each do |array|
  hash[array[0]] = array[1]
end

# Exercise 13
# Given the following data structure, return a new array containing the same
# sub-arrays as the original but ordered logically according to the numeric
# value of the odd integers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort do |ele1, ele2|
  ele1[-1] <=> ele2[-1]
end

# LS Answer

arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end

# Exercise 14
# Given this data structure write some code to return an array containing the
# colors of the fruits and the sizes of the vegetables. The sizes should be
# uppercase and the colors should be capitalized.
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

new_array = []
hsh.each do |key, value|
  if value[:type] == 'fruit'
    capitalized = value[:colors].map { |i| i.capitalize}
    new_array.insert(-1,capitalized)
  elsif value[:type] == 'vegetable'
    upcase_vegetable_size = value[:size].upcase
    new_array.insert(-1,upcase_vegetable_size)
  end
end

# LS Answer
hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end

# Exercise 15
# Given this data structure write some code to return an array which contains
# only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end

# Exercise 16

# Create a UUID when given no parameters

def uuid_creator()
  keys_to_use = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p',
              'q','r','s','t','u','v','w','x','y','z','1','2','3','4','5','6',
              '7','8','9','0']
  uuid_string = ''
  ii = 0
  while ii < 33
    uuid_string << keys_to_use.sample
    ii += 1
    if ii == 7 || ii == 11 || ii == 15 || ii == 19
      uuid_string << '-'
    end
  end
  uuid_string
end
