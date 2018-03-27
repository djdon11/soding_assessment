require 'prime'

class MaxPrimeSum
  def initialize(max_number)
    @max = max_number
    @primes = Prime.each(@max).to_a # all prime numbers matches less to max numbers
    @digits = Math.log10(@max).to_i + 1 # total digits in max number
  end

  def find_max_sum
    longest_st = []
    (0..@digits).to_a.each do |i|
      j = i
      sum = 0
      while sum < @max
        j += 1 # Increase loop by one if we have possible new numbers
        cons_numbers = @primes[i..j] # consecutive numbers
        sum = cons_numbers.inject(:+)
        if sum.prime? && cons_numbers.length > longest_st.length && sum < @max
          longest_st = cons_numbers
        end
      end 
    end
    return longest_st.inject(:+)
  end

end

#Returns maximum prime number which is a sum of longest consecutive prime numbers
puts MaxPrimeSum.new(1000000).find_max_sum

