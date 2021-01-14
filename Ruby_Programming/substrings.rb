dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

string1 = "Howdy partner, sit down! How's it going?"
string2 = "BIG HORN, WATCH OUT! IT IS DANGEROUS"

def substring (string, dictionary)
  given_string = string.downcase.to_a
  results = {}
  dictionary.each do |word|
    word_array = word.to_a
    split_string = given_string.split(word)
    num_of_instances = split_string.length - 1
    results[word] = num_of_instances
  end
  return results
end

puts substring(string1, dictionary)
puts substring(string2, dictionary)



