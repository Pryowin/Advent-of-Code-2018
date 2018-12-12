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

def remove_and_react(polymer,char)
  str = polymer.gsub(char,"")
  str1 = str.gsub(char.downcase,"")
  return react(str1)
end


response = remove_and_react('dabAcCaCBAcCcaDA', 'A')
puts "A Expected 6, got #{response}" if response != 6
response = remove_and_react('dabAcCaCBAcCcaDA', 'B')
puts "B Expected 8, got #{response}" if response != 8
response = remove_and_react('dabAcCaCBAcCcaDA', 'C')
puts "A Expected 4, got #{response}" if response != 4
response = remove_and_react('dabAcCaCBAcCcaDA', 'D')
puts "A Expected 6, got #{response}" if response != 6

str = File.read('Day5Input.txt').strip
strip_list = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
shortest = str.length
character_for_shortest = ""
i = 0

until i == strip_list.length
  response = remove_and_react(str,strip_list[i])
  if response < shortest
    shortest = response
    character_for_shortest = strip_list[i]
  end
  i += 1
end

puts shortest
