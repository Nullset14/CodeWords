# https://projecteuler.net/problem=57

enum = Enumerator.new {|y|
  counter, numerator, denominator = 0, 3, 2
  loop {
    counter += 1 if numerator.to_s.length > denominator.to_s.length
    y.yield counter
    numerator, denominator = numerator + 2 * denominator, denominator + numerator
  }
}

999.times {enum.next}
enum.next
