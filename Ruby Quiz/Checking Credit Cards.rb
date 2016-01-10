# http://rubyquiz.com/quiz122.html

class CreditCard

  def initialize(number)
    @number = number.to_s.gsub(/\D+/, '')
  end

  def luhn_valid?
    even_sum = [0, 2, 4, 6, 8, 1, 3, 5, 7, 9]
    luhn_sum = @number.reverse.chars.each_with_index.inject(0) {|sum, (num, index)|
      sum += (index.odd? ? even_sum[num.to_i] : num.to_i)
    }
    luhn_sum % 10 == 0
  end

  def card_type
    length = @number.size

    case length
      when 13
        return 'Visa' if @number =~ /^4/
      when 15
        return 'AMEX' if @number =~ /^3[47]/
      when 16
        return 'Visa' if @number =~ /^4/
        return 'Master Card' if @number =~ /^5[15]/
        return 'Discover' if @number =~ /^6011/
      else
        return 'Unknown'
    end
  end

  def to_s
    "#{@number} : #{card_type} - #{luhn_valid? ? 'Valid' : 'Invalid'}"
  end

end

if __FILE__ == $0
  puts CreditCard.new(ARGV).to_s
end
