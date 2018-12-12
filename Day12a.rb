initial_state = "##.##.#.#...#......#..#.###..##...##.#####..#..###.########.##.....#...#...##....##.#...#.###...#.##"

gen_limit = 20
rules = Hash.new
gen_state = Array.new
gen_state[0] = initial_state
plants = 11

open("Day12Input.txt") {|f|
  f.each_line do |line|
    key = line[0..4]
    value = line[9]
    rules[key] = value
  end
}

gen = 1
until gen > gen_limit
  current_state = ""
  previous_state = gen_state[gen-1].prepend("....") << "...."
  number_of_pots = gen_state[gen-1].length
  pos = 2
  until pos == number_of_pots - 2
    pots = previous_state[pos-2..pos+2]
    unless rules.key?(pots)
      current_state << "."
    else
      current_state << rules[pots]
    end
    pos +=1
  end
  gen_state[gen] = current_state
  gen +=1
end

plants = 0
pot_number = -2 * gen_limit
gen_state[gen_limit].split('').each do |pot|
  plants += pot_number if pot == "#"
  pot_number +=1
end

puts plants
