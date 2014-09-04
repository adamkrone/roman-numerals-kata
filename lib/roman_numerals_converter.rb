# Roman Numeral Converter Kata
#
# Convert an arabic numeral to a roman numeral
#
# Ex.
#
#   converter = RomanNumeralConverter.new
#   converter.convert(2014) # => "MMXIV"
#
# Convert a roman numeral to arabic
#
# Ex.
#
#   converter = RomanNumeralConverter.new
#   converter.convert("MMXIV") # => 2014
#

class RomanNumeralConverter
  NUMBERS = [
    [1000, "M"],
    [900, "CM"],
    [500, "D"],
    [400, "CD"],
    [100, "C"],
    [90, "XC"],
    [50, "L"],
    [40, "XL"],
    [10, "X"],
    [9, "IX"],
    [5, "V"],
    [4, "IV"],
    [1, "I"]
  ]

  def convert(number)
    return roman_to_arabic(number) if number.is_a? String
    arabic_to_roman(number)
  end

  private

  def roman_to_arabic(number)
    return 0 if number == ""
    result = 0
    number.chars.each_with_index do |char, i|
      char_arabic = find_arabic(char)
      next_char_arabic = find_arabic(number[i+1])
      if char_arabic < next_char_arabic
        result -= char_arabic
      else
        result += char_arabic
      end
    end
    result
  end

  def find_arabic(char)
    NUMBERS.each do |arabic, roman|
      return arabic if char == roman
    end
    0
  end

  def arabic_to_roman(number)
    result = ""
    NUMBERS.each do |arabic, roman|
      while number >= arabic
        result << roman
        number -= arabic
      end
    end
    result
  end
end
