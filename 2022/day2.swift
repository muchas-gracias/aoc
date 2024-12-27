import Foundation

let INPUT_FILE: String = "details/day2.txt"

class Match
{
    var total: Int
    var total2: Int
    var guest: [String]
    var you: [String]
    var lst: [[String]]
    var loss: Int
    var draw: Int
    var win: Int
    var scissors: Int
    var paper: Int
    var rock: Int

    init(lst: [[String]])
    {
        self.total = 0
        self.total2 = 0
        self.guest = ["A", "B", "C"]
        self.you = ["X", "Y", "Z"]
        self.lst = lst
        self.loss = 0
        self.draw = 3
        self.win = 6

        self.scissors = 2
        self.paper = 1
        self.rock = 0

    }

    func totals(you: Int, guest: Int) -> Int
    {
        var total = 0

        if guest == you
        {
            total += self.draw
        }

        if you > guest
        {
            if you == self.scissors && guest == self.rock
            {
                total += self.loss
            }
            else
            {
                total += self.win
            }
        }

        if guest >  you
        {
            if you == self.rock && guest == self.scissors
            {
                total += self.win
            }
            else
            {
                total += self.loss
            }
        }
        
        return total
    }

    func match() -> (Int, Int)
    {
        var guestindex = 0
        var youindex = 0

        for each in self.lst
        {
            if let guestindex = self.guest.firstIndex(of: each[0]),
            let youindex = self.you.firstIndex(of: each[1])
            {
                self.total += youindex + 1
                self.total += self.totals(you: youindex, guest: guestindex)
            }

            if youindex == 1
            {
                youindex = guestindex
                self.total2 += youindex + 1
                self.total2 += self.totals(you: youindex, guest: guestindex)
                continue
            }

            if youindex == 0
            {
                if guestindex == self.rock
                {
                    youindex = self.scissors
                }

                if guestindex == self.paper
                {
                    youindex = self.rock
                }

                if guestindex == self.scissors
                {
                    youindex = self.paper
                }

                self.total2 += youindex + 1
                self.total2 += self.totals(you: youindex, guest: guestindex)
                continue
            }

            if youindex == 2
            {
                if guestindex == self.rock
                {
                    youindex = self.paper
                }

                if guestindex == self.paper
                {
                    youindex = self.scissors
                }

                if guestindex == self.scissors
                {
                    youindex = self.rock
                }

                self.total2 += youindex + 1
                self.total2 += self.totals(you: youindex, guest: guestindex)
                continue

            }
        }

        return (self.total, self.total2)
    }

}

func main() 
{
    var lst: [[String]] = []

    do 
    {
        let contents = try String(contentsOfFile: INPUT_FILE, encoding: String.Encoding.utf8)
        let lines = contents.split(separator: "\n")
        for line in lines 
        {
            let components = line.split(separator: " ")

            let componentsList = components.map { String($0) }

            lst.append(componentsList)
        }
    } 
    catch 
    {
        print("Error: \(error.localizedDescription)")
    }

    let matches = Match(lst: lst)
    let (result1, result2) = matches.match()

    print("Part 1  = \(result1)")
    print("Part 2 = \(result2)")
    
}

main()
