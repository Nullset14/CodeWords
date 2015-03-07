# https://projecteuler.net/problem=5
#
def lcm(*num)
  return lcm(num.first, lcm(*num[1..-1])) if num.length > 2
  (num.first * num.last) / gcd(*num)
end

def gcd(*num)
  return gcd(num.first, gcd(*num[1..-1])) if num.length > 2
  num.sort!
  return num.last if num.first == 0
  gcd(num.first, num.last % num.first)
end

11.upto(20).inject(2520) {|_lcm, number| lcm(_lcm, number)}
