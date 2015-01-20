# Problem: https://www.facebook.com/hackercup/problems.php?pid=582062045257424&round=742632349177460
# Solution: https://www.facebook.com/notes/1043281905687710/
# ruby ~/Cooking\ the\ Books.rb < ~/cooking_the_books.txt
#

max = proc {|numbers, n| numbers.max}
@min = proc {|numbers, n| numbers.min}
min = proc {|numbers, n|
  minimum = @min.call(numbers - ['0'], n)
  raise 'MinimumError' if n[0] == minimum
  minimum
}

def cook_the_book(n, &block)
  return n if (n == '0' || n == '')
  numbers = n.split('')
  begin
    value = block.call(numbers, n)
  rescue => e
    raise e if e.message != 'MinimumError'
    return (n[0] + cook_the_book(n[1..-1], &@min))
  end
  if n[0] == value
    return (value + cook_the_book(n[1..-1], &block))
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
  print "Case ##{idx}: #{cook_the_book(n.dup, &min)} #{cook_the_book(n.dup, &max)}\n"
end
