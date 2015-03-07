# https://projecteuler.net/problem=4
#
(999 * 999).downto(100 * 100).each do |product|
  if product.to_s == product.to_s.reverse
    999.downto(100).each do |divisor|
      quotient, remainder = product.divmod(divisor)
      break if quotient > divisor
      p product and exit if (remainder == 0 && quotient >= 100 && quotient <= 999)
    end
  end
end
