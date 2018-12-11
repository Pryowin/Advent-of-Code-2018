require 'set'
frequency = 0
used_frequency = Set[0]

while true
  open("Day1Input.txt") {|f|
    f.each_line do |line|
      frequency_change = line.to_i
      frequency += frequency_change
      if used_frequency.include?(frequency)
        puts frequency
        return
      else
        used_frequency.add(frequency)
    end

  end
}
end
