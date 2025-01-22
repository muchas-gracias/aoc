
INPUT_FILE = "details/day1.txt"

def check_for_duplicates(lst):
    seen = set()

    for each in lst:
        if each in seen:
            return each
        seen.add(each)
    return 50000

def analyze(lst: list, part: int, tally, tally_lst):
    plus = '+'
    minus = '-'
    return_val = 0

    for each in lst:

        symbol = each[0]
        value = each[1:]

        if symbol == plus:
            tally += int(value)
        else:
            if symbol == minus:
                tally -= int(value)

        tally_lst.append(tally)

    if part == 2:
        return_val = check_for_duplicates(tally_lst)


    return tally, return_val, tally_lst

def main():
    tally_lst = []
    lst = []
    cnt = 0
    return_val = 0

    with open(INPUT_FILE, 'r') as file:
        content = file.read()
        for each in content.split():
            lst.append(each)

    cnt, return_val, tally_lst = analyze(lst, 1, 0, tally_lst)
    print(f"Part 1 = {cnt}")

    cnt = 0
    tally_lst.clear()
    while True:
        cnt, return_val, tally_lst = analyze(lst, 2, cnt, tally_lst)

        if return_val == 50000:
            continue
        else:
            break

    print(f"Part 2 = {return_val}")

main()