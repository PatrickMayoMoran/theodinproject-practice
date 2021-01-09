require 'pry'

'''
def make_caesar_cipher(string, offset)
  num_array = convert_to_nums(string)
  offset_array = add_offset(num_array, offset)
  new_array = convert_to_chars(offset_array)
  return new_string
end
'''

def convert_to_nums(string)
  string_array = string.split('')
  num_array = string_array.map {|char| char.ord}
  return num_array
end

p convert_to_nums("Deez Nuttz")

def add_offset(num_array, offset)
  offset_array = num_array.map do |num|
    if lowercase?(num)
      lower_offset(num, offset)
    elsif  uppercase?(num)
      upper_offset(num, offset)
    else
      return num
    end
  end
end

def lowercase?(num)
  num.between?(97, 122)
end

def uppercase?(num)
  num.between?(65, 90)
end

def lower_offset(num, offset)
  num -= 97
  alphabet = ('a'..'z').to_a
  position = num + offset
  if position > 25
    position -= 25
  end
  return position
end

def upper_offset(num, offset)
  num -= 65
  alphabet = ('A'..'Z').to_a
  position = num + offset
  if position > 25
    position -= 25
  end
  return position
end
  