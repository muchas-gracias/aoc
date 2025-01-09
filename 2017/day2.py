INPUT_FILE = "details/day2.txt"

def high_low(lst):
    low = min(lst)
    high = max(lst)
    
    return (high - low)
    
def evenly_divide(lst):
    for each in lst:
        for idx in lst:
            if idx != each:
                if each % idx == 0:
                    value  = each // idx
                    return value
    return 0
def main():
    test = []
    tally1 = 0
    tally2 = 0
    
    with open(INPUT_FILE, 'r') as file:
        for line in file:
            line_data = [int(item) for item in line.strip().split()]
            test.append(line_data)
    for each in test:
        tally1 += high_low(each)
        tally2 += evenly_divide(each)

        
    print(f"Part 1 = {tally1}")
    print(f"Part 2 = {tally2}")

main()