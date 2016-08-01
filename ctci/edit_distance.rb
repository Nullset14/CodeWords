class EditDistance

  attr_reader :x, :y, :word1, :word2

  def initialize(word1, word2)
    @word1 = word1 
    @word2 = word2
    @x = word1.length + 1
    @y = word2.length + 1
  end

  def distance(row=x-1, column=y-1)
    matrix[row][column]
  end

  private
  
  def insert_cost
    1
  end

  def replacement_cost(index1, index2)
    word1[index1] == word2[index2] ? 0 : 1
  end

  def delete_cost
    1
  end 

  def matrix
    z = -1
    distances = Array.new(y) { z += 1; [z] }
    distances[0] = Array(0...x)

    (1...y).each do |row|
        (1...x).each do |column|
          temp_distance = []
          temp_distance << distances[row-1][column-1] + replacement_cost(column-1, row-1)        
          temp_distance << distances[row-1][column] + delete_cost
          temp_distance << distances[row][column-1] + insert_cost
          
          distances[row][column] = temp_distance.min  
        end
    end

    distances
  end
end

# a = EditDistance.new("writers","vintner")
# a.distance
