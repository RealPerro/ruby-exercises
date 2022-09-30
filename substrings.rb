def substrings(word, valid_s)
    result = Hash.new(0)
    valid_s.each do |string|
        result[string] = word.downcase.scan(string.downcase).size
    end
    return result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
phrase = "Howdy partner, sit down! How's it going?"

puts substrings(phrase, dictionary)