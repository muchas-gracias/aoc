
INPUT_FILE = "details/input.txt"

def part1(numbers)
    increase = 0
    decrease = 0
    comparison = 0

    line_len = numbers.length - 1

    numbers.each do |idx|
        if comparison == 0
            comparison = idx

        else
            if comparison < idx
                diff = (comparison - idx).abs

                if diff > 0 and diff < 4
                    increase += 1
                end
            end

            if comparison > idx
                diff = (comparison - idx).abs
                if diff > 0 and diff < 4
                    decrease += 1
                end
            end
        end

        comparison = idx
    end

    if increase == line_len or decrease == line_len
        return true
    end
end

def part2(numbers)
    line_len = numbers.length
    counter = 0

    while counter < line_len
        val = numbers.slice!(counter)

        if part1(numbers)
            return true
        end

        numbers.insert(counter, val)
        counter += 1
    end

    return false
end

def main
    part1_safe = 0
    part2_safe = 0

    File.open(INPUT_FILE, "r") do |file|
        file.each_line do |line|
            numbers = line.split.map(&:to_i)

            if part1(numbers)
                part1_safe += 1

            else
                if part2(numbers)
                    part2_safe += 1
                end
            end
        end
    end

    puts "Part 1 = #{part1_safe}"
    puts "Part 2 = #{part2_safe + part1_safe}"
end

main