# https://code.google.com/codejam/contest/11254486/dashboard#s=p0

$stdout.reopen('output.txt', 'w')
$stdout.sync = true

case_no = 0
iterations = $stdin.gets.chomp.to_i

iterations.times {
  case_no += 1
  char_count = Hash.new(0)

  anagram = $stdin.gets.chomp
  anagram.split("").each do |char|
    char_count[char] += 1
  end

  num_count = Hash.new(0)

  # Zero
  count = char_count['Z']
  if count > 0
    num_count[0] = count
    char_count['Z'] -= count
    char_count['E'] -= count
    char_count['R'] -= count
    char_count['O'] -= count
  end

  # Two
  count = char_count['W']
  if count > 0
    num_count[2] =  count
    char_count['T'] -= count
    char_count['W'] -= count
    char_count['O'] -= count
  end

  # Eight
  count = char_count['G']
  if count > 0
    num_count[8] = count
    char_count['E'] -= count
    char_count['I'] -= count
    char_count['G'] -= count
    char_count['H'] -= count
    char_count['T'] -= count
  end

  # Six
  count = char_count['X']
  if count > 0
    num_count[6] = count
    char_count['S'] -= count
    char_count['I'] -= count
    char_count['X'] -= count
  end

  # Seven
  count = char_count['S']
  if count > 0
    num_count[7] = count
    char_count['S'] -= count
    char_count['E'] -= count
    char_count['V'] -= count
    char_count['E'] -= count
    char_count['N'] -= count
  end

  # Five
  count = char_count['V']
  if count > 0
    num_count[5] = count
    char_count['F'] -= count
    char_count['I'] -= count
    char_count['V'] -= count
    char_count['E'] -= count
  end

  # Nine
  count = char_count['I']
  if count > 0
    num_count[9] = count
    char_count['N'] -= count
    char_count['I'] -= count
    char_count['N'] -= count
    char_count['E'] -= count
  end

  # Four
  count = char_count['F']
  if count > 0
    num_count[4] = count
    char_count['F'] -= count
    char_count['O'] -= count
    char_count['U'] -= count
    char_count['R'] -= count
  end

  # Three
  count = char_count['T']
  if count > 0
    num_count[3] = count
    char_count['T'] -= count
    char_count['H'] -= count
    char_count['R'] -= count
    char_count['E'] -= count
    char_count['E'] -= count
  end

  # One
  count = char_count['O']
  if count > 0
    num_count[1] = count
    char_count['O'] -= count
    char_count['N'] -= count
    char_count['E'] -= count
  end

  number = ""
  (0..9).each do |num|
    next unless num_count[num] > 0
    number << num.to_s * num_count[num]
  end

  puts "Case ##{case_no}: #{number}"
}
