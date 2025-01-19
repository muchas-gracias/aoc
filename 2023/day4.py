

INPUT_FILE = 'details/day4.txt'


def double_sequence(tick):
    sequence = [1]
    
    for i in range(1, tick):
        sequence.append(sequence[-1] * 2)
        
    return(sequence[-1])

def process(left, right):
    count = 0
    tick = 0
    
    for each in right:
        if each in left:
            tick += 1
    
    if tick:
        count = double_sequence(tick)

    return (count, tick)

def main():
    card_copies = []
    tick = 0
    with open(INPUT_FILE, 'r') as file:
        count = 0
        card = 1
        for line in file:
            
            row = line.strip()
            numbers = row.split(":")[1].strip()
            left, right = numbers.split("|")
            
            test_data = list(map(int, left.split()))
            check_data = list(map(int, right.split()))
            
            result, tick= process(test_data, check_data)

            card_copies.append(card)
            if tick:
                if card_copies:
                    for each in card_copies:
                        if each == card:
                            for i in range(card + 1, card + tick + 1):
                                card_copies.append(i)
            count += result
            
            card += 1
            
    print(f"Part 1 = {count}")
    print(f"Part 2 = {len(card_copies)}")
            
    
        

main()