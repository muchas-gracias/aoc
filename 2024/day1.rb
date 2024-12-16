
INPUT_FILE = "details/day1.txt"

def part_2(left, right)
    total = 0

    left.each do |item|
        k = item.to_i
        total += k * right.count(k)
    end

    puts total

    return
end

def part_1(left, right)
    total = 0

    left.each_with_index do |value, i|
        total += (value - right[i]).abs
    end
    puts total
    return total
end

def append_lists(lines)
    left = []
    right = []

    lines.each do |line|
        line = line.strip.split
        left << line[0].to_i
        right << line[1].to_i
    end

    return left, right
end

def main
    lines = File.readlines(INPUT_FILE)

    left, right = append_lists(lines)
    left  = left.sort
    right = right.sort

    total = part_1(left, right)
    part_2(left, right)

end


main