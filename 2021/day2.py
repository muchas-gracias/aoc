INPUT_FILE = "details/day2.txt"


def add_horizontal(fwd):
    result = 0
    for each in fwd:
        result += each

    return result


def add_vertical(up, dwn):
    up_result = 0
    dwn_result = 0

    for each in up:
        up_result += each
    for each in dwn:
        dwn_result += each

    return abs(up_result - dwn_result)


def calculate_depth(vertical, horizontal):

    if vertical != 0:
        depth = horizontal * vertical

    return depth

def part2(lst):

    horizontal = 0
    vertical = 0
    depth = 0

    for each in lst:
        if each[0] == 1:
            horizontal += each[1]
            if vertical != 0:
               depth += calculate_depth(vertical, each[1])

        if each[0] == 2:
            vertical += each[1]

        if each[0] == 3:
            vertical -= each[1]


    return depth * horizontal

def main():
    fwd = []
    dwn = []
    up = []
    part2_lst = []
    with open(INPUT_FILE, 'r') as file:
        for line in file:
            direction, value = line.strip().split()
            value = int(value)

            if direction == 'forward':
                fwd.append(value)
                part2_lst.append([1, value])  # 1 is for forward

            if direction == 'down':
                dwn.append(value)
                part2_lst.append([2, value])  # 2 is for down

            if direction == 'up':
                up.append(value)
                part2_lst.append([3, value])  # 3 is for up

    fwd_total = add_horizontal(fwd)
    vertical_total = add_vertical(up, dwn)

    print(f"Part 1 = {fwd_total * vertical_total}")

    result = part2(part2_lst)
    print(f"Part 2 = {result}")



main()