import sys
sys.setrecursionlimit(8000)

INPUT_FILE = "details/day14.txt"

SECONDS = 100
WIDTH = 101
HEIGHT = 103

ROW_MID = ((HEIGHT - 1) // 2)
INDEX_MID = ((WIDTH - 1) // 2)


class Redoubt:
    def __init__(self):
        self.top_left = 0
        self.top_right = 0
        self.bot_left = 0
        self.bot_right = 0
        self.map = []
        self.easter_egg_seconds = 0
        self.iterations = 0
        self.master_list = []
        self.connected_hashtags = 0

    def calculate_quadrant(self, row, index):

        if row < ROW_MID and index < INDEX_MID:
            self.top_left += 1
            return

        if row < ROW_MID and index > INDEX_MID:
            self.top_right += 1
            return

        if row > ROW_MID and index < INDEX_MID:
            self.bot_left += 1
            return

        if row > ROW_MID and index > INDEX_MID:
            self.bot_right += 1
            return

        return

    def multiply_quadrants(self):
        return self.top_left * self.top_right * self.bot_left * self.bot_right

    def create_map(self):

        rows = HEIGHT
        cols = WIDTH

        for idx in range(rows):
            self.map.append(['.'] * cols)

    def reset_map(self):
        for row in self.map:
            for index in range(len(row)):
                if row[index] == '#':
                    row[index] = '.'

    def continuously_connected(self, row):
        count = 0

        for element in row:
            if element == '#':
                count += 1
                if count == 7:
                    self.connected_hashtags += 1
                    break

            else:
                count = 0

        if self.connected_hashtags == 8:
            return True
        return False

    def find_easter_egg(self):
        self.iterations += 1
        found = False

        for each in self.master_list:
            x = (each[0] + each[2] * self.easter_egg_seconds) % WIDTH
            y = (each[1] + each[3] * self.easter_egg_seconds) % HEIGHT

            for idx in range(len(self.map)):
                if idx == y:
                    row = self.map[idx]
                    row.pop(x)
                    row.insert(x, '#')

        for row in self.map:
            found = self.continuously_connected(row)
            if found:
                break

        self.connected_hashtags = 0

        if not found:
            if self.iterations == 8000:
                return

            else:
                self.reset_map()
                self.easter_egg_seconds += 1
                self.find_easter_egg()

        return self.easter_egg_seconds

    def start_part_2(self, master_list):
        self.master_list = master_list.copy()
        seconds = self.find_easter_egg()

        return seconds


def find_pos(px, py, vx, vy):
    x = (px + vx * SECONDS) % WIDTH
    y = (py + vy * SECONDS) % HEIGHT

    return x % WIDTH, y % HEIGHT


def main():
    master_list = []
    part1 = Redoubt()

    with open(INPUT_FILE, 'r') as file:

        for line in file:
            values = []
            parts = line.strip().split()
            for part in parts:
                if '=' in part:
                    nums = part.split('=')[1].split(',')
                    values.extend(map(int, nums))
            master_list.append(values)

            #  part 1
            position = find_pos(values[0], values[1], values[2], values[3])
            part1.calculate_quadrant(position[1], position[0])

    sum = part1.multiply_quadrants()
    print(f"Part 1 = {sum}")

    #  part 2
    part2 = Redoubt()
    part2.create_map()
    seconds = part2.start_part_2(master_list)

    print(f"Part 2 = {seconds}")


main()
