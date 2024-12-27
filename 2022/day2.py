INPUT_FILE = "details/day2.txt"

class Match:
    def __init__(self, lst):
        self.total = 0
        self.total2 = 0
        self.guest = ['A', 'B', 'C']
        self.you = ['X', 'Y', 'Z']
        self.lst = lst

        # -----------------------
        self.loss = 0
        self.draw = 3
        self.win = 6

        #------------------------
        self.scissors = 2
        self.paper = 1
        self.rock = 0

    def totals(self, you, guest):
        total = 0

        if guest == you:
            total += self.draw

        if you > guest:
            if you == self.scissors and guest == self.rock:
                total += self.loss
            else:
                total += self.win

        if guest > you:
            if you == self.rock and guest == self.scissors:
                total += self.win
            else:
                total += self.loss


        return total

    def match(self):

        for each in self.lst:
            guest = self.guest.index(each[0])
            you = self.you.index(each[1])
            
            self.total += you + 1
            self.total += self.totals(you, guest)

            #  for draw
            if you == 1:
                you = guest

                self.total2 += you + 1
                self.total2 += self.totals(you, guest)
                continue
            
            #  to lose
            if you == 0:
                
                if guest == self.rock: 
                    you = self.scissors
                if guest == self.paper:
                    you = self.rock
                if guest == self.scissors:
                    you = self.paper

                self.total2 += you + 1
                self.total2 += self.totals(you, guest)
                continue

            #  to win
            if you == 2:
                if guest == self.rock:
                    you = self.paper
                if guest == self.paper:
                    you = self.scissors
                if guest == self.scissors:
                    you = self.rock
                
                self.total2 += you + 1
                self.total2 += self.totals(you, guest)  
                continue

        return self.total, self.total2

            
def main():
    lst = []
    with open(INPUT_FILE, 'r') as file:
        for line in file:
            line = line.strip()
            columns = line.split()
            lst.append(columns)

    match = Match(lst)

    result = match.match()

    print(f"Part 1 = {result[0]}")
    print(f"Part 2 = {result[1]}")


main()