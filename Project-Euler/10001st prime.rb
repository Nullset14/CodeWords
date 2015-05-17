# https://projecteuler.net/problem=7

require 'singleton'

class EratosthenesSieve
include Singleton

  def initialize
    @primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101]
    @last_checked = @primes[-1] + 1
  end

  def get_nth_prime(n)
    compute_primes while @primes.size < n
    @primes[n-1]
  end

  def compute_primes
    range = 9999
    @last_checked = primes[-1] + 1 if @last_checked < @primes[-1]
    sieve_last = @last_checked + range
    sieve = (@last_checked .. sieve_last).to_a
    max_factor = (sieve[-1] ** 0.5).to_i

    size = range + 1
    @primes.each do |prime|
      break if prime > max_factor
      idx = -@last_checked % prime
      loop {
        break if idx > size - 1
        sieve[idx] = nil
        idx += prime
      }
    end
    @primes.concat(sieve.compact)
    @last_checked = sieve_last
  end
end

EratosthenesSieve.instance.get_nth_prime(10001)
