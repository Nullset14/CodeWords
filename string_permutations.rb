# A beautiful example of recursion.
# This is a program to list all permutations of a string.
# This can also be used to list all possible strings from a given input.
# For a deeper understanding : http://www.ericleschinski.com/c/java_permutations_recursion/
#
def permute(fixed = "", string)

  if string.length == 0
    # uncomment below line to list all permutations of the input of same length
    # puts fixed
    return fixed
  end

  len = string.length
  index = 0

  while (index < len)
    # uncomment below line to list all permutations of varying length
    # puts string[0...index] + string[index+1..-1]
    permute(fixed + string[index], string[0...index] + string[index+1..-1])
    index += 1
  end

end

permute("ABCD")