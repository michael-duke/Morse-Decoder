MORSE_TRANSLATOR = {
  '.-' => 'a',
  '-...' => 'b',
  '-.-.' => 'c',
  '-..' => 'd',
  '.' => 'e',
  '..-.' => 'f',
  '--.' => 'g',
  '....' => 'h',
  '..' => 'i',
  '.---' => 'j',
  '-.-' => 'k',
  '.-..' => 'l',
  '--' => 'm',
  '-.' => 'n',
  '---' => 'o',
  '.--.' => 'p',
  '--.-' => 'q',
  '.-.' => 'r',
  '...' => 's',
  '-' => 't',
  '..-' => 'u',
  '...-' => 'v',
  '.--' => 'w',
  '-..-' => 'x',
  '-.--' => 'y',
  '--..' => 'z',
  ' ' => ' ',
  '.----' => '1',
  '..---' => '2',
  '...--' => '3',
  '....-' => '4',
  '.....' => '5',
  '-....' => '6',
  '--...' => '7',
  '---..' => '8',
  '----.' => '9',
  '-----' => '0'
}.freeze

def decode_char(morse_char)
  MORSE_TRANSLATOR[morse_char].upcase
end

def decode_word(morse_word)
  word = ''
  morse_word.split.each { |letter| word += decode_char(letter) }
  word
end

def decode(morse_sentence)
  # splits at every 3 spaces
  morse_words = morse_sentence.split('   ')
  output = ''
  morse_words.each { |morse_word| output += "#{decode_word(morse_word)} " }
  output.strip
end

# Tests
puts decode_char('-.-') #=> K
puts decode_word('-- .. -.-. .-. --- ...- . .-. ... .') # => MICROVERSE
puts decode('-- -.--   -. .- -- .') # => MY NAME
sentence = '.-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ...'
puts decode(sentence) # => A BOX FULL OF RUBIES
