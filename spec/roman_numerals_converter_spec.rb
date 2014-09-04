require 'rspec/given'
require 'roman_numerals_converter'

RSpec::Given.use_natural_assertions

describe RomanNumeralConverter do
  Given(:converter) { RomanNumeralConverter.new }

  def convert(number)
    converter.convert(number)
  end

  context 'when the number is arabic' do
    Then { convert(1) == "I" }
    Then { convert(2) == "II" }
    Then { convert(4) == "IV" }
    Then { convert(5) == "V" }
    Then { convert(6) == "VI" }
    Then { convert(9) == "IX" }
    Then { convert(10) == "X" }
    Then { convert(20) == "XX" }
    Then { convert(40) == "XL" }
    Then { convert(50) == "L" }
    Then { convert(90) == "XC" }
    Then { convert(100) == "C" }
    Then { convert(400) == "CD" }
    Then { convert(500) == "D" }
    Then { convert(900) == "CM" }
    Then { convert(1000) == "M" }

    Then { convert(2014) == "MMXIV" }
    Then { convert(3999) == "MMMCMXCIX" }
    Then { convert(0) == "" }
  end

  context 'when the number is roman' do
    Then { convert("I") == 1 }
    Then { convert("II") == 2 }
    Then { convert("IV") == 4 }
    Then { convert("V") == 5 }
    Then { convert("VI") == 6 }
    Then { convert("IX") == 9 }
    Then { convert("X") == 10 }
    Then { convert("XX") == 20 }
    Then { convert("XL") == 40 }
    Then { convert("L") == 50 }
    Then { convert("XC") == 90 }
    Then { convert("C") == 100 }
    Then { convert("CD") == 400 }
    Then { convert("D") == 500 }
    Then { convert("CM") == 900 }
    Then { convert("M") == 1000 }

    Then { convert("MMXIV") == 2014 }
    Then { convert("MMMCMXCIX") == 3999 }
    Then { convert("") == 0 }
  end
end
