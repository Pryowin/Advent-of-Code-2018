
Instructions = Struct.new(:can_only_start_once_completed, :list_of_parts)


def create_rules(fileName)

  can_only_start_once_completed = Hash.new
  list_of_parts = ""

  open(fileName) {|f|
    f.each_line do |line|
      step_cannot_start = line[36]
      list_of_parts << step_cannot_start unless list_of_parts.include? step_cannot_start
      step_depends_on = line[5]
      list_of_parts << step_depends_on unless list_of_parts.include? step_depends_on
      if can_only_start_once_completed.key?(step_cannot_start)
        str = can_only_start_once_completed[step_cannot_start]
        str << step_depends_on
        can_only_start_once_completed[step_cannot_start] = str
      else
        can_only_start_once_completed[step_cannot_start] = step_depends_on
      end
    end
  }
  return Instructions.new(can_only_start_once_completed, list_of_parts.split('').sort.join)
end

def all_complete?(depends_on, order)
  ret_val = true

  depends_on.chars.each do |char|
    ret_val = false unless order.include? char
  end
  return ret_val
end

def build_order(build_instructions)

  order = ""
  remove_part = ""
  unused_parts = build_instructions.list_of_parts
  number_of_parts = build_instructions.list_of_parts.length

  until order.length == number_of_parts
    part_added = false
    until part_added
      unused_parts.chars.each do |part|
        unless build_instructions.can_only_start_once_completed.key?(part)
          order << part
          remove_part = part
          part_added = true
        else
          depends_on = build_instructions.can_only_start_once_completed[part]
          if all_complete?(depends_on, order)
            order << part
            remove_part = part
            part_added = true
          end
        end
        break if part_added
      end
      unused_parts.gsub!(remove_part,'')
    end
  end
  return order
end


can_only_start_once_completed = create_rules('Day7TestInput.txt')
puts build_order(can_only_start_once_completed)

can_only_start_once_completed = create_rules('Day7Input.txt')
puts build_order(can_only_start_once_completed)
