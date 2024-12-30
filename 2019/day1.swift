import Foundation


let INPUT_FILE = "details/day1.txt"

func calculation(number: Int) ->  Int
{
    let value = number / 3

    let result = value - 2

    return result
}


func main()
{
    var value1: Int = 0
    var value2: Int = 0
    var test_value: Int = 0

    var lst: [Int] = []
    
    var part1_tally: Int = 0
    var part2_tally: Int = 0

    do
    {
       let contents = try String(contentsOfFile: INPUT_FILE, encoding: .utf8)
       let lines = contents.split(separator: "\n")

       for line in lines
       {
           if let number = Int(line)
           {
                value1 = calculation(number: number)
                part1_tally += value1

                test_value = number
                while true
                {
                    value2 = calculation(number: test_value)
                    if value2 > 0
                    {
                        lst.append(value2) 
                        test_value = value2
                    }
                    else
                    {
                        break
                    }
                }
           }
       } 
       part2_tally = lst.reduce(0, +)
    }
    catch
    {
        print("Error Reading File")
    }

    print("Part 1 = \(part1_tally)")
    print("Part 2 = \(part2_tally)")
}



main()