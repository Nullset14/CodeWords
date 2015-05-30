# https://projecteuler.net/problem=99

line_num, max_line, max_value = 0, 0, 0

File.foreach('p099_base_exp.txt') {|line|
  line_num += 1
  number, exponent = line.split(',')
  value = exponent.to_i * Math.log10(number.to_i)
  (max_value = value; max_line = line_num) if max_value < value
}

puts max_line
