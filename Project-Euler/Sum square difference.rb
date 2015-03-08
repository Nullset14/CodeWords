# https://projecteuler.net/problem=6
#
difference = Proc.new {|n| (n*(n+1))**2/4 - (n*(n+1)*(2*n+1))/6}
difference.call(100)
