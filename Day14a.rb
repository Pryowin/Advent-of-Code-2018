recipes = [3,7]
puzzle_input = 894501
elf1_pos = 0
elf2_pos = 1
recipe_set = 10
attempts = 0
max_attempts = puzzle_input - 2 + recipe_set

def next_pos(elf, recipes)
  recipe_count = recipes.length
  return (elf + 1 + recipes[elf]) % recipe_count
end

until attempts ==  max_attempts

  combined_score = recipes[elf1_pos] + recipes[elf2_pos]

  if combined_score < 10
    recipes.push(combined_score)
    attempts += 1
  else
    recipe1 = combined_score / 10
    recipe2 = combined_score % 10
    recipes.push(recipe1)
    recipes.push(recipe2)
    attempts += 2
  end

  elf1_pos = next_pos(elf1_pos,recipes)
  elf2_pos = next_pos(elf2_pos,recipes)
end

puts recipes[recipes.length-10..recipes.length].join
