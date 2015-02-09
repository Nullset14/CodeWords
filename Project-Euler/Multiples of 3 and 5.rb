# https://projecteuler.net/problem=1
#
sumOfTerms = Proc.new {|multiple|  noOfTerms = 999/multiple; noOfTerms * (noOfTerms + 1) * multiple / 2}
sumOfTerms.call(3) + sumOfTerms.call(5) - sumOfTerms.call(15)
