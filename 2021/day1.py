INPUT_FILE = "day1.txt"


def part2(test_data):
    idx = 0
    count = 0

    length = len(test_data)
    limit = length - 2
    previous = 0

    while idx < limit:
        result = int(test_data[idx]) + \
            int(test_data[idx + 1]) + int(test_data[idx + 2])
        if previous == 0:
            previous = result
        else:
            if result > previous:
                count += 1
                previous = result
            else:
                previous = result
        idx += 1

    return count


def main():
    previous = 0
    count = 0
    test_data = []

    with open(INPUT_FILE, 'r') as file:
        for line in file:
            test_data.append(line.rstrip('\n'))
            if previous == 0:
                previous = int(line)
            else:
                if int(line) > previous:
                    count += 1
                    previous = int(line)
                else:
                    previous = int(line)

        part2_count = part2(test_data)

    print(f"Part 1 = {count}")
    print(f"Part 2 = {part2_count}")


main()
