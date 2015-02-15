# https://projecteuler.net/problem=2
#
evenFibonacciSum = 0
consTerms = [1,1]
while consTerms.first < 4_000_001
  evenFibonacciSum += consTerms.first if consTerms.first.even?
  consTerms = [consTerms.last, consTerms.inject(:+)]
end
