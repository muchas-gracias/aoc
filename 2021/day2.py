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


def main():
    fwd = []
    dwn = []
    up = []
    with open(INPUT_FILE, 'r') as file:
        for line in file:
            direction, value = line.strip().split()
            value = int(value)

            if direction == 'forward':
                fwd.append(value)

            if direction == 'down':
                dwn.append(value)

            if direction == 'up':
                up.append(value)

    fwd_total = add_horizontal(fwd)
    vertical_total = add_vertical(up, dwn)

    print(fwd_total * vertical_total)





main()