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

        // --------------------
        self.loss = 0
        self.draw = 3
        self.win = 6

         // -------------------
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

    func part2() -> (Int)
    {
        var guest = 0
        var you = 0

        for each in self.lst
        {
            if let guest_idx = self.guest.firstIndex(of: each[0]),
            let you_idx = self.you.firstIndex(of: each[1])
            {

                guest = guest_idx
                you = you_idx

                if you == 0
                {
                    if guest == self.rock
                    {
                        you = self.scissors
                    }
                    if guest == self.paper
                    {
                        you = self.rock
                    }
                    if guest == self.scissors
                    {
                        you = self.paper
                    }

                    self.total2 += you + 1
                    self.total2 += self.totals(you: you, guest: guest)
                    continue
                }

                if you == 1
                {
                    you = guest
                    self.total2 += you + 1
                    self.total2 += self.totals(you: you, guest: guest)
                    continue
                }

                if you == 2
                {
                    if guest == self.rock
                    {
                        you = self.paper
                    }

                    if guest == self.paper
                    {
                        you = self.scissors
                    }

                    if guest == self.scissors
                    {
                        you = self.rock
                    }


                    self.total2 += you + 1
                    self.total2 += self.totals(you: you, guest: guest)
                    continue
                }
            } 
        }
        return self.total2
    }

    func match() -> (Int)
    {

        for each in self.lst
        {
            if let guest_idx = self.guest.firstIndex(of: each[0]),
            let you_idx = self.you.firstIndex(of: each[1])
            {
                self.total += you_idx + 1
                self.total += self.totals(you: you_idx, guest: guest_idx)
            }
        }

        return (self.total)
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
    let result1 = matches.match()
    let result2 = matches.part2()

    print("Part 1  = \(result1)")
    print("Part 2 = \(result2)")
    
}

main()
