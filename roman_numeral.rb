describe 'Converting Arabic Numerals to Roman Numerals'  do
  NUMERAL_TRANSLATIONS = {
    'I' => 1,
    'II' => 2,
    'III' => 3,
    'IV' => 4,
    'V' => 5,
    'IX' => 9,
    'X' => 10,
    'XIV' => 14,
    'XIX' => 19,
    'XXIV' => 24,
    'XXV' => 25,
    'XLIX' => 49,
    'L' => 50,
    'XCIX' => 99,
    'C' => 100,
    'D' => 500,
    'CMXCIX' => 999,
    'M' => 1000,
    'MCM' => 1900,
    'MMCM' => 2900,
    'MMCMXLIX' => 2949,
    'MMCMXCIX' => 2999,
    'MMM' => 3000,
    'MMMI' => 3001,
    'MMMDCCLXVII' => 3767
  }
  NUMERAL_TRANSLATIONS.each_pair do |roman, arabic|
    it "converts #{arabic} to #{roman}" do
      expect(arabic_to_roman(arabic)).to eql(roman)
    end
  end
end

ROMAN_TO_ARABIC_MAPPING = {
  'I' => 1,
  'IV' => 4,
  'V' => 5,
  'IX' => 9,
  'X' => 10,
  'XL' => 40,
  'L' => 50,
  'XC' => 90,
  'C' => 100,
  'CD' => 400,
  'D' => 500,
  'CM' => 900,
  'M' => 1000
}

# Lets us iterate through Roman numerals by size
### Better as an Enum? Didn't find how to create one in Ruby
ROMAN_HIGH_TO_LOW = ['M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I']

def arabic_to_roman(number)
  roman_string = ''

  ROMAN_HIGH_TO_LOW.each do |roman_symbol|
    num_roman = num_roman_symbols(number, roman_symbol)

    if num_roman > 0
      roman_string << roman_symbol * num_roman
      number = deduct_roman_from_number(number, num_roman, roman_symbol)
    end
  end

  roman_string
end

def num_roman_symbols(number, roman_symbol)
  raise_if_invalid_roman!(roman_symbol)
  arabic = ROMAN_TO_ARABIC_MAPPING[roman_symbol]

  number / arabic
end

def deduct_roman_from_number(number, num_roman, roman_symbol)
  raise_if_invalid_roman!(roman_symbol)
  number -= ROMAN_TO_ARABIC_MAPPING[roman_symbol] * num_roman
end

def raise_if_invalid_roman!(roman_symbol)
  raise ArgumentError, 'Invalid Roman numeral passed' if !ROMAN_HIGH_TO_LOW.include?(roman_symbol)
end
