# https://code.google.com/codejam/contest/6254486/dashboard#s=p2&a=0
# Brute Force Search with some optimization. Not the best Algorithm for a Big Dataset

$stdout.reopen('output.txt', 'w')
$stdout.sync = true

require 'prime'
iterations = $stdin.gets.chomp.to_i
case_no = 0

iterations.times {
  n, j = $stdin.gets.chomp.split(" ").map(&:to_i)
  case_no += 1
  first = 2**(n-1) + 1
  last = 2**n - 1

  valid = []
  (first..last).step(2).each do |number|
    (2..10).each do |radix|
      break if number.to_s(radix).to_i(radix).prime?
      valid << number.to_s(2) if radix == 10
    end
    break if valid.length == j
  end

  puts "Case ##{case_no}:"

  generator = Prime::EratosthenesSieve.instance
  valid.each do |number|

    factors = []
    (2..10).each do |radix|
      counter = 1
      number_ = number.to_i(radix)
      loop do
        break if number_ % generator.get_nth_prime(counter) == 0
        counter += 1
      end
      factors << generator.get_nth_prime(counter)
    end

    puts "#{number} #{factors.join(" ")}"
  end
}