def strings_differ_by_one (str1,str2)
  a1 = str1.split('')
  a2 = str2.split('')
  diff = 0
  a1.each_index do |index|
    diff += 1 if a1[index] != a2[index]
  end
  return true if diff == 1
  return false
end

def common_chars (str1, str2)
  a1 = str1.split('')
  a2 = str2.split('')
  a3 = Array.new
  a1.each_index do |index|
    a3.push a1[index] if a1[index] == a2[index]
  end
  return a3.join
end


lines = Array.new
open("Day2Input.txt") {|f|
  f.each_line do |line|
      lines.push line
    end
}
box_count = lines.length
found_string = 0
found_other_string = 0
lines.each_index do |index|

  index2 = index + 1
  until index2 == box_count || found_string > 0 do
    found_string = index2 if strings_differ_by_one(lines[index], lines[index2])
    index2 +=1
  end

  if found_string > 0
      found_other_string = index
      break
  end
end

puts "String #{found_string} : #{lines[found_string]} v String #{found_other_string} :#{lines[found_other_string]}"

puts common_chars(lines[found_string], lines[found_other_string])
