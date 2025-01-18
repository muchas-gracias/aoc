import re

INPUT_FILE = "details/day1.txt"


def get_num(lst: list) -> int:
    test = ""
    new_value = None
    for each in lst:
        for idx in each:
            if idx.isdigit():
                test += idx
                
    if len(test) == 0:
        return 0
      
    if len(test) == 2:       
        new_value = int(test)

    else:
        val1 = test[0]
        val2 = test[len(test) - 1]
        new_value = val1 + val2
        new_value = int(new_value)
    
    return new_value
        
def get_spelling(lst: list, iteration) -> int:

    input_string = lst[0]
    indexes = {}
    indices = []
    return_value = 0
    numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    num_word = {"zero": "0", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5","six": "6", "seven": "7", "eight": "8", "nine": "9",}

    with open('100.txt', 'a') as file:
        for index, each in enumerate(input_string):
            if each.isdigit():
                indexes[index] = each
                
        for val, num in num_word.items():
            for match in re.finditer(val, input_string):
                index = match.start()
                indexes[index] = num
                
        if indexes:
            sorted_dict = dict(sorted(indexes.items()))
            if iteration == 42:
                print(sorted_dict)
                print(indexes)
                print(lst)
            
            lst2 = list(sorted_dict.values())
            if len(lst2) > 1:
                test = lst2[0] + lst2[-1]
                return_value = int(test)
            
            if len(lst2) == 1:
                test = lst2[0] + lst2[0]
                return_value = int(test)
                
            if len(lst2) == 0:
                return_value = 0
            file.write(f"{str(return_value)}\n")
        
    return return_value

def main():
    lst = []
    tally1 = 0
    tally2 = 0
    num = 0
    with open(INPUT_FILE, 'r') as file:
        for line in file:
            # print(f" #{num}")
            num += 1
            lst.append(line)
            tally1 += get_num(lst)
            tally2 += get_spelling(lst, num)
            lst.clear()
            
    print(f"Part 1 = {tally1}")
    print(f"Part 2 = {tally2}")

main()