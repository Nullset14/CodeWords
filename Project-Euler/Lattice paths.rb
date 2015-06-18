# https://projecteuler.net/problem=15

# A more elegant way to solve this problem is to think of the path as 20 steps towards east and 20 steps towards south. 
# A sample path would be EESSSSSEEESEEESSSESEEESEEEESSSSEEESESSSE. No matter how we travel E1 comes before E2, S2 before S3
# and so on. So treating all E's and all S's identical will give us the total permutations as 40!/(20! * 20!)

class Grid

  def initialize(length, breadth)
    @length = length
    @breadth = breadth
    @grid = []
  end

  def routes
    (@length + 1).times {|l|
      @grid[l] = []

      (@breadth + 1).times {|b|
        @grid[l][b] = if l.zero? && b.zero?
                        1
                      elsif l.zero?
                        @grid[l][b-1]
                      elsif b.zero?
                        @grid[l-1][b]
                      else
                        @grid[l-1][b] + @grid[l][b-1]
                      end
      }
      
    }
    @grid[@length][@breadth]
  end

end

Grid.new(20, 20).routes
