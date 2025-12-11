import random

FILENAME = "details/day5.txt"

class Cafeteria:
    def __init__(self, sec1, sec2):
        self.sec1 = sec1
        self.sec2 = sec2
        self.range = []
        self.count = 0
        self.total = 0
        self.lst = []
    
    def part2(self):
        ranges = []
        for rnge in self.sec1:
            a, b = map(int, rnge.split("-"))
            ranges.append((a, b))

        ranges.sort()

        merged = []
        for start, end in ranges:
            if not merged or start > merged[-1][1] + 1:
                merged.append([start, end])
            else:
                merged[-1][1] = max(merged[-1][1], end)

        total = 0
        for a, b in merged:
            total += (b - a + 1)

        return total

            
    def part1(self):
        found = 0

        for each in self.sec2:
            found = 0
            for range in self.sec1:  
                start, end = map(int, range.split("-"))  
                if int(each) >= int(start) and int(each) <= end:
                    found += 1        
               
            if found >= 1:
                self.count += 1
                
        return self.count
        
def main():
    sec1 = []
    sec2 = []
    current = sec1
    
    with open(FILENAME) as file:
        for line in file:
            line = line.strip()

            if line == "":
                current = sec2   
                continue
            
            current.append(line)
            
    cafeteria_part1 = Cafeteria(sec1, sec2)
    cafeteria_part2 = Cafeteria(sec1, sec2)

    answer1 = cafeteria_part1.part1()
    answer2 = cafeteria_part2.part2()
    
    
    print(f"Part 1 = ", answer1)
    print(f"Part 2 = ", answer2)
    
if __name__ == "__main__":
  main()




