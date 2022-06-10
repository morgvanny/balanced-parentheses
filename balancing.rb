# Input: '(()())'
# Output: 0

# Input: '()))'
# Output: 2

# Input: ')'
# Output: 1

# input "("
# output 1

# input "((((()"
# output 4

# input "((()"
# output 2

# input "())"
# output 1

# input "))((((())(()))"
# output 4

# input "())))((("
# output 6

def number_to_balance(test_string)
  open_and_not_closed = 0
  closed_and_not_opened = 0

  #i = 0
  # while i < test_string.length
  #   if test_string[i] == "("
  #     open_and_not_closed += 1
  #   elsif test_string[i] == ")"
  #     if open_and_not_closed > 0
  #       open_and_not_closed -= 1
  #     else
  #       closed_and_not_opened += 1
  #     end
  #   end
  #   i += 1
  # end

  test_string.chars.each do |char|
    if char == "(" # any time the character is an opening parenthesis
      # it can't have been closed yet because it's just now opening, so add 1 to open_and_not_closed
      open_and_not_closed += 1
    elsif open_and_not_closed > 0 # if it wasn't an opening, we know it must be a closing - so now we check if we have any open that haven't been closed
      # subtract 1 from open_and_not_closed if there are any. this close must be closing the last unclosed open one we saw
      open_and_not_closed -= 1
    else # we only get here if it was a closing AND there were no previous open ones that haven't been closed yet
      # so we add one to closed_and_not_opened. this closing one must be extra if there are no previously opened and unclosed ones
      closed_and_not_opened += 1
    end
  end
  open_and_not_closed + closed_and_not_opened # all unmatched parentheses, whether they were open ones that were never closed, or extra closing ones without previous unclosed opening ones
end

def test(input, expected_output)
  puts "Input: #{input} Output: #{number_to_balance(input)}  Expected: #{expected_output}"
end

test("(()())", 0)
test("()))", 2)

test("))((((())(()))", 4)
test(")))(((()", 6)
