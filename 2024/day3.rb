
INPUT_FILE = "details/day3.txt"

def part_2(content)

  amt_with_conditions = 0
  counting = true

  matches_with_conditions = content.scan(/(do\(\)|don't\(\)|mul\((\d+),(\d+)\))/)

  matches_with_conditions.each do |match|
    if match[0] == 'do()'
      counting = true

    elsif match[0] == "don't()"
      counting = false

    elsif counting && match[0].start_with?('mul')
      x, y = match[0].scan(/\d+/).map(&:to_i)
      amt_with_conditions += x * y
    end
  end

  return amt_with_conditions

end

def main
  amt1 = 0

  content = File.read(INPUT_FILE)

  matches = content.scan(/mul\((\d+),(\d+)\)/)
  matches.each do |x, y|
    amt1 += x.to_i * y.to_i
  end

  amt2 = part_2(content)

  puts amt1
  puts amt2

end

main