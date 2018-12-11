two_count = 0
three_count = 0
puts "START"
open("Day2Input.txt") {|f|
  f.each_line do |line|
    sorted_line = line.chars.sort.join
    last_char = ""
    two_char = false
    three_char = false
    char_count = 1
    puts line
    puts sorted_line
    sorted_line.split('').each do |char|
      if char == last_char
        char_count += 1
        puts "char #{char} : count #{char_count}"
      else
        two_char = true if char_count == 2
        three_char = true if char_count == 3
        char_count = 1
        last_char = char
      end
    end
    two_char = true if char_count == 2
    three_char = true if char_count == 3

    two_count += 1 if two_char
    three_count += 1 if three_char
    puts "Two: #{two_count}, Three: #{three_count}"
  end
}
puts two_count * three_count
