# https://code.google.com/codejam/contest/6254486/dashboard#s=p1&a=0

$stdout.reopen('output.txt', 'w')
$stdout.sync = true

iterations = $stdin.gets.chomp.to_i
case_no = 0

iterations.times {
  case_no += 1
  cakes = $stdin.gets.chomp

  index = 0
  while cakes[index] == '-'
    index += 1
  end

  count = 0
  count += 1 if index > 0

  loop do
    while cakes[index] == '+'
      index += 1
    end

    current_index = index
    while cakes[index] == '-'
      index += 1
    end

    (current_index != index) ? (count += 2) : break
  end

  puts "Case ##{case_no}: #{count}"
}