require 'pry'

def make_caesar_cipher(string, offset)
  num_array = convert_to_nums(string)
  offset_array = add_offset(num_array, offset)
  new_string = offset_array.join
  return new_string
end


def convert_to_nums(string)
  string_array = string.split('')
  num_array = string_array.map {|char| char.ord}
  return num_array
end

p convert_to_nums("My man!")

def add_offset(num_array, offset)
  offset_array = num_array.map do |num|
    if lowercase?(num)
      lower_offset(num, offset)
    elsif  uppercase?(num)
      upper_offset(num, offset)
    else
      return num.chr
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
  position = num + offset
  if position > 25
    position -= 25
  end

  alphabet = ('a'..'z').to_a
  return alphabet[position]
end

def upper_offset(num, offset)
  num -= 65
  position = num + offset
  if position > 25
    position -= 25
  end

  alphabet = ('A'..'Z').to_a
  return alphabet[position]
end
  
puts make_caesar_cipher("Dirt on your couch!")