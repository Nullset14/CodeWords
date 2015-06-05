# https://projecteuler.net/problem=97

@exponent = STDIN.read.to_i
@divisor = 10_000_000_000

def compute_remainder(power)
  exponents_remainders =[[1, power]]
  exponent, remainder = 2, power

  while exponent <= @exponent
    exponents_remainders << [exponent, remainder = (remainder ** 2) % @divisor]
    exponent <<= 1
  end

  exponent, remainder = exponents_remainders.pop

  while !exponents_remainders.empty?
    pre_computed_exponent, pre_computed_remainder = exponents_remainders.pop
    if pre_computed_exponent + exponent <= @exponent
      remainder = (remainder * pre_computed_remainder) % @divisor
      exponent += pre_computed_exponent
    end
  end

  remainder
end

(28433 * compute_remainder(2) + 1) % @divisor
