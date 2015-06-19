# Facebook Hacker Cup 2015 Qualification Round - Cooking the Books
# Problem: https://www.facebook.com/hackercup/problems.php?pid=582062045257424&round=742632349177460
# Solution: https://www.facebook.com/notes/1043281905687710/
# ruby ~/Cooking\ the\ Books.rb < ~/cooking_the_books.txt
# 

max = proc {|numbers| numbers.max}
min = proc {|numbers| numbers.min}
_min = proc {|numbers| min.call(numbers - ['0'])}

def cook_the_book(n, condition, &block)
  return n if (n == '0' || n == '')
  numbers = n.split('')
  if block_given?
    value = block.call(numbers)
    return (value + cook_the_book(n[1..-1], condition)) if value == n[0]
  end
  value = condition.call(numbers)
  if n[0] == value
    return (value + cook_the_book(n[1..-1], condition))
  else
    index = 0
    numbers.each_with_index {|num, idx| index = idx if num == value}
    n[index], n[0] = n[0], n[index]
  end
  n
end

$stdout.reopen('output.txt', 'w')

STDIN.each_with_index do |line, idx|
  next if idx == 0
  n = line.chomp
  print "Case ##{idx}: #{cook_the_book(n.dup, min, &_min)} #{cook_the_book(n.dup, max)}\n"
end
