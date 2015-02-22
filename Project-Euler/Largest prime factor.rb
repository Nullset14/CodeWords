# https://projecteuler.net/problem=3
# Every prime number is of the form 6n+1/6n-1 (2,3 being anomalies) where n is an integer.
# The Generator23 class generates all such potential primes.
# If a potential prime divisor leaves a zero remainder after dividing the number then it is a prime divisor.
# We repeat the process with the number as quotient obtained in the above step to extract more prime divisors.
# The process terminates once we examine all numbers till the square root of the number.
# More details can be found in Ruby's Prime Library.

class Generator23
  def initialize
    @prime = 1
    @step = nil
  end

  def succ
    if (@step)
      @prime += @step
      @step = 6 - @step
    else
      case @prime
        when 1; @prime = 2
        when 2; @prime = 3
        when 3; @prime = 5; @step = 2
      end
    end
    @prime
  end

  def max_factor(number)
    return number if number == 2
    succ
    loop {
      quotient, remainder = number.divmod @prime
      if quotient >= @prime
        remainder == 0 ? (number = quotient) : succ
      else
        return number
      end
    }
  end
end

Generator23.new.max_factor(600851475143)
