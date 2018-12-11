frequency = 0
open("Day1Input.txt") {|f|
  f.each_line do |line|
    frequency_change = line.to_i
    frequency += frequency_change
  end
}
puts frequency
