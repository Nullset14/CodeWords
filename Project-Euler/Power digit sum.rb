# https://projecteuler.net/problem=16

(1 << 1000).to_s.chars.inject(0) {|sum, num| sum += num.to_i}
