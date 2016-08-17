module MergeSort
    attr_reader :inversion_count
    
    def sort(arr)
      @inversion_count = 0
      merge_sort(arr)
    end
      
    private 
    
    def merge_sort(arr)
      len = arr.length
      return arr if len <= 1
      
      left = merge_sort(arr[0...len/2])
      right = merge_sort(arr[len/2...len])
      
      merge(left, right)
    end    
    
    def merge(left, right)
      result = []
      
      until (left.empty? || right.empty?)
        result << if left.first <= right.first
                    left.shift
                  else
                    @inversion_count += left.length
                    right.shift
                  end
      end

      result.concat(left).concat(right)  
    end    
end  

# include MergeSort
# sort IO.read("input.txt").scan(/\d+/).map!(&:to_i)
# inversion_count
