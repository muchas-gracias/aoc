FILENAME = "details/day1.txt"
START = 50

class SecretEntrance:
    def __init__(self):
        self.current = 50
        self.dir = ""
        self.zeros = 0
        self.zeros_pointed = 0
        self.min = 0
        self.max = 99
    
    def direction(self, value):
        self.dir = value[:1]
   
    def get_integer(self, value):
        index = 1
        number = int(value[1:])
 
        if self.dir == "R":
            while index <= number:
                if self.current + 1 <= self.max:
                    self.current += 1
                else:
                    self.current = self.min 
                    self.zeros_pointed += 1

                index += 1

        else:
            while index <= number:
                if self.current - 1 >= self.min:
                    self.current -= 1
                else:
                    self.current = self.max
                    
                if self.current == 0:
                    self.zeros_pointed += 1
                index += 1
            
        if self.current == 0:
            self.zeros += 1

def main(): 
    enter = SecretEntrance()
    
    with open(FILENAME, "r") as file:
        for line in file:
            val = line.strip()
            enter.direction(val)
            enter.get_integer(val)
              
    print(f"Part 1 = ", enter.zeros)
    print(f"Part 2 = ", enter.zeros_pointed)

if  __name__ == "__main__": 
    main()