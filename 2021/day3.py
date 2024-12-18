INPUT_FILE = "details/day3.txt"


def populate_list(lst, line):
    idx = 0
    length = len(line)

    while idx < length:
        lst.append(0)
        idx += 1

    return lst


def part1_modify(occurences):

    for index, each in enumerate(occurences):
        if each < 0:
            occurences.pop(index)
            occurences.insert(index, 0)
        else:
            occurences.pop(index)
            occurences.insert(index, 1)

    return occurences


def get_decimal(occurences):
    string_representation = ""
    for each in occurences:
        string_representation += str(each)

    gamma = int(string_representation, 2)

    return gamma


def inverse(occurences):

    for index, each in enumerate(occurences):
        if each == 0:
            occurences.pop(index)
            occurences.insert(index, 1)
        else:
            occurences.pop(index)
            occurences.insert(index, 0)

    return occurences


def main():

    occurences = []
    get_length = False

    with open(INPUT_FILE, 'r') as file:

        for line in file:
            line = line.strip()
            if not get_length:
                occurences = populate_list(occurences, line)
                get_length = True

            for index, each in enumerate(line):

                if int(line[index]) == 1:
                    print("yep")
                    occurences[index] += 1
                else:
                    occurences[index] -= 1

    occurences = part1_modify(occurences)
    gamma = get_decimal(occurences)
    occurences = inverse(occurences)
    epsilom = get_decimal(occurences)

    print(f"Part 1 = {epsilom * gamma}")


main()
