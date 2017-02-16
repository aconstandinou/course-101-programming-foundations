# question 1
# Typically, when you reference an uninitialized variable, Ruby will raise
# an exception, stating that it’s undefined. However, when you initialize a
# local variable within an if block, even if that if block doesn’t get executed,
# the local variable is initialized to nil.

# question 2
# greetings binds to a hash { a: 'hi' }
# informal_greetings also binds to same hash since it was assigned to greetings
# we mutate informal_greetings, therefore greetings was also mutated

# question 4
def is_an_ip_number?(string_num)
  return string_num.to_i.to_s == string_num
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.length != 4
    false
  else
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      false unless is_an_ip_number?(word)
    end
    true
  end
end
