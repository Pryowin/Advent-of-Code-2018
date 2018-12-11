
fabric = Hash.new(0)
max_x = 0
max_y = 0
open("Day3Input.txt") {|f|
  f.each_line do |line|

    pos_x = line.index("@ ") + 2
    pos_y = line.index(",") + 1
    pos_width = line.index(": ") + 2
    pos_height = line.index("x") + 1
    x_start = line[pos_x...-1].to_i
    y_start = line[pos_y...-1].to_i
    width = line[pos_width...-1].to_i
    height = line[pos_height...-1].to_i

    x = x_start
    until x == x_start + width
      max_x = x if x > max_x
      y = y_start
      until y == y_start + height
        max_y = y if y > max_y
        fabric[[x,y]] += 1
        y += 1
      end
      x += 1
    end
  end
}
pattern = 0
open("Day3Input.txt") {|f|
  f.each_line do |line|

    pattern = line.to_i
    pos_x = line.index("@ ") + 2
    pos_y = line.index(",") + 1
    pos_width = line.index(": ") + 2
    pos_height = line.index("x") + 1
    x_start = line[pos_x...-1].to_i
    y_start = line[pos_y...-1].to_i
    width = line[pos_width...-1].to_i
    height = line[pos_height...-1].to_i

    x = x_start
    no_overlap = true
    until x == x_start + width
      y = y_start
      until y == y_start + height
        no_overlap = false if fabric[[x,y]] != 1
        y += 1
      end
      x += 1
    end
    break if no_overlap
  end
}

print pattern
