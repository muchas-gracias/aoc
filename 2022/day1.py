import time

INPUT_FILE = "day1.txt"

def check_values_list(lst, value):

    for index, element in enumerate(lst):
        if value > element:
            lst.insert(index, value)
            lst.pop()
            break

def main():
    count = 0
    prev = 0
    number = 0
    values_list = [0, 0, 0]

    with open(INPUT_FILE, 'r') as file:
        for line in file:
            value = line.strip()
            try:
                number = int(value)
                count += number

            except ValueError:
                check_values_list(values_list, count)

                count = 0
                continue
 
    check_values_list(values_list, count)
    print(f"Part 1 = {values_list[0]}")
    print(f"Part 2 = {sum(values_list)}")

main()

