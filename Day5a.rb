def react(polymer)
  polymer_array = polymer.split('')
  i = 0
  while i < polymer_array.length - 1
    str1 = polymer_array[i]
    str2 = polymer_array[i+1]
    if (str1 != str2) && (str1.downcase == str2.downcase)
      polymer_array.delete_at(i)
      polymer_array.delete_at(i)
      i -= 1 if i > 0
    else
      i += 1
    end
  end
  return polymer_array.join.length
end

response = react('aA')
puts "aA Expected 0, got #{response}" if response != 0
response = react('abBA')
puts "abBA Expected 0, got #{response}" if response != 0
response = react('aabAAB')
puts "aabAAB Expected 6, got #{response}" if response != 6
response = react('dabAcCaCBAcCcaDA')
puts "dabAcCaCBAcCcaDA Expected 10, got #{response}" if response != 10


str = File.read('Day5Input.txt')
puts str.length
puts react(str.strip!)
