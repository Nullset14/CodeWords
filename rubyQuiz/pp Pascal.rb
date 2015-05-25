# http://rubyquiz.com/quiz84.html

# Pascal's triangle in Ruby.
# Pascal's triangle is a triangular array of the binomial coefficients
# Pascal.new(5).tree
#
class Pascal

  def initialize(n)
    @degree = n
    # Width of each number is the maximum coefficient in the last binomial expansion, which is nCn/2
    @width = (n.downto(n/2 + (n.even? ? 1 : 2) ).inject {|m, k| m*k } / (1..n/2).inject {|m, k| m*k }).to_s.length * 2
  end

  def tree
    n = @degree
    (0..n).each do |k|
      @prev_row = if k == 0
                    @prev_row = [1]
                  elsif k == 1
                    [1, 1]
                  else
                    self.cal_row(k)
                  end
      printf (" " * (@width/2 * (@degree - k)))
      @prev_row.each { |x| printf("%-#{@width}s", x) }
      printf ("\n")
    end
  end

  # Calculate current binomial coefficients using previous coefficients.
  # The Binomial Coefficients are symmetrical. This property is used in computing the second half of the coefficients.
  #
  def cal_row(n)
    f = []
    (0..n/2).each do |k|
      f << if k == 0
             1
           else
             (@prev_row[k] + @prev_row[k-1])
           end
    end
    f.concat(f[0, (n+1)/2].reverse)
  end
