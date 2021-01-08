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

def add_offset(num_array)
  offset_array = num_array.map do |num|
    if lowercase?(num)
      lower_offset(num)
    elsif  uppercase?(num)
      upper_offset(num)
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


  