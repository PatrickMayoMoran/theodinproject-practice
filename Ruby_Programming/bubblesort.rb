test_array_1 = [14, 14, 16, 1, 4, 9, 12]
test_array_2 = [1, 6, 9, 24, 13, 16, 7, 8, 3]

def bubble_pass(array)
  array.each_with_index do |item, indx|
    val_1 = item
    val_2 = array[indx + 1]
    transfer = 0
    unless indx == (array.length - 1)
      if val_1 > val_2
        transfer = val_2
        array[indx + 1] = val_1
        array[indx] = transfer
      end
    end
  end
end

def bubble_sort(array)
  unless sorted?(array)
    bubble_pass(array)
    bubble_sort(array)
  end
  array
end

def sorted?(array)
  array.each_with_index do |item, ind|
    unless ind == (array.length - 1)
      if item > array[ind + 1]
        return false
      end
    end
  end
  return true
end


puts bubble_sort(test_array_1)
puts bubble_sort(test_array_2)