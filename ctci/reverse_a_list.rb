def reverse_a_list(list, index=0)
  return ([] << list[index]) if list.size == index+1
  reverse_a_list(list, index+1).concat([] << list[index])
end

print reverse_a_list [1,2,3,4,5]