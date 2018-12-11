

def power(x,y,serial)
  rackid = x + 10
  starting_power = rackid * y
  power_level = starting_power + serial
  power_level = power_level * rackid
  if power_level < 100
    hundred_digit = 0
  else
    power_level_string = power_level.to_s
    power_level_string_length = power_level_string.length
    hundred_digit = power_level_string[power_level_string_length-3].to_i
  end
  return hundred_digit - 5
end


def power_block(x,y,serial)

  pb = 0
  x1 = x
  until x1 == x + 3
    y1 = y
    until y1 == y + 3
      pb += power(x1,y1,serial)
      y1 += 1
    end
    x1 += 1
  end
  return pb
end

x=1
max_power = -99
max_x = 0
max_y = 0
serial = 8141
until x == 298
  y = 1
  until y == 298
    p = power_block(x,y,serial)
    if p > max_power
      max_power = p
      max_x = x
      max_y = y
    end
    y += 1
  end
  x += 1
end

puts "x: #{max_x}, y: #{max_y}"
