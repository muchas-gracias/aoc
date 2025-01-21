
from functools import cache

INPUT_FILE = "details/day11.txt"


@cache
def analyze(stone, blinks):

    if blinks == 0:
        return 1

    if stone == 0:
        return analyze(1, blinks -1)

    elif len(str(stone)) % 2 == 0:
        length = len(str(stone))
        left = int(str(stone)[:length // 2])
        right = int(str(stone)[length // 2:])
        return analyze(left, blinks -1) + analyze(right, blinks -1)

    else:
        return analyze(2024 * stone, blinks -1)



def main():
    cnt = 25

    with open(INPUT_FILE, 'r') as file:
        content = file.read()

    digits = [int(group) for group in content.split()]

    print(sum(analyze(x, cnt) for x in digits))
    cnt = 75
    print(sum(analyze(x, cnt) for x in digits))


main()