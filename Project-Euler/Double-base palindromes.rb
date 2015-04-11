# https://projecteuler.net/problem=36

class PalindromeGenerator
  def initialize(no_of_digits, digits)
    @no_of_digits = no_of_digits
    @digits = digits
    # Assuming first digit is insignificant in the respective base system (like 0 in base 10)
    @palindromes = [digits[1..-1]]
  end

  def generate
    1.upto(@no_of_digits).each {|size|

      palindromes =  @palindromes[size-1] || (if size.even?
                                                generate_even_palindromes(size)
                                              else
                                                generate_odd_palindromes(size)
                                              end)

      palindromes.each {|_pal|
        yield(_pal)
      } if block_given?

      @palindromes[size-1] ||= palindromes
    }
    @palindromes.flatten
  end

  def generate_odd_palindromes(size)
    @digits.inject([]) {|_result, digit|
      result = get_n_digit_palindromes(size-1).map {|_pal|
         _pal.dup.insert(size/2, digit)
      }
      _result.concat(result)
    }
  end

  def generate_even_palindromes(size)
    get_n_digit_palindromes(size-1).map {|_pal|
      _pal.dup.insert(size/2, _pal[(size-1) / 2])
    }
  end

  def get_n_digit_palindromes(n)
    if !block_given?
      @palindromes[n-1]
    else
      @palindromes[n-1].each {|_pal|
        yield(_pal)
      }
    end
  end
end

t20_digit_palindromes = PalindromeGenerator.new(20, ['0','1']) 
t20_digit_palindromes.generate.keep_if {|b|
  base_10_value = b.to_i(2)
  (base_10_value.to_s == base_10_value.to_s.reverse) && (base_10_value < 1_000_000)
}.inject(0) {
    |sum, a| sum += a.to_i(2)
}
