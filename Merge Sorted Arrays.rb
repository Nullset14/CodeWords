# Merge all elements of 2 sorted arrays eliminating duplicates
# Objects of the arrays should be comparable
#
def mergeArrays(a, b)

  a_idx, b_idx = 0, 0
  a_len, b_len = a.length, b.length
  merged_array = []

  # Keep track of indices and compare sorted values in parallel
  while (a_idx < a_len && b_idx < b_len)
    case a[a_idx] <=> b[b_idx]
      when 0
        merged_array << a[a_idx]
        a_idx += 1
        b_idx += 1
      when -1
        merged_array << a[a_idx]
        a_idx += 1
      else
        merged_array << b[b_idx]
        b_idx += 1
    end
  end

  # merge remainder values of either of the arrays
  merged_array.concat(a[a_idx..-1]).concat(b[b_idx..-1])

  merged_array
end


print mergeArrays([1,3], [1,2,4])
