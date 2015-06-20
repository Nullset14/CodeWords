# Dutch National Flag problem using 3-way partition

def dutch_national_flag(min, max, numbers)
  low = 0
  high = numbers.length - 1

  low += 1  while numbers[low] <= min
  high -= 1 while numbers[high] >= max

  pointer = low

  while pointer <= high
    if numbers[pointer] >= max
      numbers[pointer], numbers[high] = numbers[high], numbers[pointer]
      high -= 1
    elsif numbers[pointer] <= min
      numbers[pointer], numbers[low] = numbers[low], numbers[pointer]
      low += 1
      pointer += 1
    else
      pointer += 1
    end
  end

  numbers

end 
