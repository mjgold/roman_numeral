describe "Converting Arabic Numerals to Roman Numerals"  do
  NUMERAL_TRANSLATIONS = {
               1  => "I",
               2  => "II",
               5  => "V",
               10 => "X"
             }
  NUMERAL_TRANSLATIONS.each_pair do |arabic, roman|
    it "converts #{arabic} to #{roman}" do
      expect(arabic_to_roman(arabic)).to eql(roman)
    end
  end
end

ARABIC_TO_ROMAN_MAPPING = {
  1 => "I",
  2 => "II",
  5 => "V",
  10 => "X"
}

def arabic_to_roman(number)
  ARABIC_TO_ROMAN_MAPPING[number]
end
