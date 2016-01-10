# Print powers of 2 less than or equal to the given number using recursion.
#
def powers_of_two(x)
  puts 1 or return 1 if x <= 1
  prev = powers_of_two(x/2)
  power = 2*prev
  puts power
  power
end

powers_of_two(100)
