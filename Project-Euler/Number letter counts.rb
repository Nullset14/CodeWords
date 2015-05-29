# https://projecteuler.net/problem=17

class Integer

  WORDS = {1 => 'one', 2 => 'two', 3 => 'three', 4 =>'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine',
           10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen',
           16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen', 20 => 'twenty', 30 => 'thirty',
           40 => 'forty', 50 => 'fifty', 60 => 'sixty', 70 => 'seventy',  80 => 'eighty', 90 => 'ninety', 100 => 'hundred',
           1000 => 'thousand'}

  def to_words
    words = []

    thousands, number = self.divmod 1000
    if thousands > 0
      words << thousands.to_words
      words << WORDS[1000]
    end

    hundreds, number = number.divmod 100
    if hundreds > 0
      words << WORDS[hundreds]
      words << WORDS[100]
      words << 'and' if number > 0
    end

    tens, units = number.divmod 10
    if number > 0
      if WORDS[number].nil?
        words << WORDS[tens * 10]
        words << WORDS[units]
      else
        words << WORDS[number]
      end
    end

    words.join(' ')
  end

end

(1..1000).inject(0){|result, num| result += num.to_words.gsub(/\s/, '').length}
