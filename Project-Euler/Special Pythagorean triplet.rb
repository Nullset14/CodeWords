# https://projecteuler.net/problem=9

499.downto(1).each do |side1|
  (501-side1).upto(side1).each do |side2|
    hypotenuse = 1000 - (side1 + side2)
    if hypotenuse == Math.sqrt(side1 ** 2 + side2 ** 2)
      p side1 * side2 * (hypotenuse) and exit
    else
      next
    end
  end
end
