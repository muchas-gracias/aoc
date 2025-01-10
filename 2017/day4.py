INPUT_FILE = "details/day4.txt"

def find_valid(lst):
    invalid = False
    unique = []
  
    for each in lst:
        if each not in unique:
            unique.append(each)
    
    if len(lst) != len(unique):
        invalid = True
        
    return invalid

def rearranged_valid(lst):

    test = []
    unique = []
    word = ""
    
    for each in lst:
        for letter in each:
            test.append(letter)
        
        sorted_lst = sorted(test)
        for val in sorted_lst:
            word += val
       
        if word not in unique:
            unique.append(word)
        else:
            return False
        
        word = ""
        sorted_lst.clear()
        test.clear()
        
    return True
  
def main():
    valid1 = 0
    valid2 = 0
    
    with open(INPUT_FILE, 'r') as file:
        for line in file:
            line_data = [str(item) for item in line.strip().split()]
  
            if False is find_valid(line_data):
                valid1 += 1
            if True is rearranged_valid(line_data):
                valid2 += 1
    print (f"Part 1 = {valid1}")
    print (f"Part 2 = {valid2}")
main()