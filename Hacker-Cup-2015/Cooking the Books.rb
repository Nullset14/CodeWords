# Problem: https://www.facebook.com/hackercup/problems.php?pid=582062045257424&round=742632349177460
# Solution: https://www.facebook.com/notes/1043281905687710/
# ruby ~/Cooking\ the\ Books.rb < ~/cooking_the_books.txt
#
def cook_the_book(n, &block)
  return n if (n == '0' || n == '')
  numbers = n.split('')
  value = block.call(numbers, n)
  if n[0] == value
    return (value + cook_the_book(n[1..-1], &block))
  else
    index = 0
    numbers.each_with_index {|num, idx| index = idx if num == value}
    n[index], n[0] = n[0], n[index]
  end
  n
end

max = Proc.new {|numbers, n| numbers.max}

min = lambda {|numbers, n|
  minimum = numbers.min
  if @iter.nil?
    @iter = false
    return (n[0] + cook_the_book(n[1..-1], &min)) if n[0] == '1'
    minimum = (numbers - ['0']).min if minimum == '0'
  end
  minimum
}

$stdout.reopen('output.txt', 'w')

STDIN.each_with_index do |line, idx|
  next if idx == 0
  n = line.chomp
  @iter = nil
  print "Case ##{idx}: #{cook_the_book(n.dup, &min)} #{cook_the_book(n.dup, &max)}\n"
end
