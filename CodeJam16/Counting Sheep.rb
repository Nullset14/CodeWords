# https://code.google.com/codejam/contest/6254486/dashboard#s=p0&a=0

$stdout.reopen('output.txt', 'w')
$stdout.sync = true

require 'set'

case_no = 0
iterations = $stdin.gets.chomp.to_i

iterations.times {
  case_no += 1
  number = $stdin.gets.chomp.to_i
  numbers = Set.new [number]
  digits = Set.new number.to_s.split("").map(&:to_i)
  new_number = number

  loop do
    if digits.length == 10
      puts "Case ##{case_no}: #{new_number}"
      break
    elsif numbers.include?(new_number + number)
      puts "Case ##{case_no}: INSOMNIA"
      break
    else
      new_number += number
      numbers.add(new_number)
      digits.merge(new_number.to_s.split("").map(&:to_i))
    end

  end
}