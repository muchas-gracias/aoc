import Foundation

let INPUT_FILE = "details/day2.txt"


func evaluate(digits: [String], trimmed: String, letter: Character) -> Bool
{
    var occurences: Int = 0
    

    occurences = trimmed.filter {$0 == letter}.count

    if let lowrange = Int(digits[0]), let highrange = Int(digits[1])
    {
        if occurences == 0
        {
            return false
        }

        if occurences >= lowrange && occurences <= highrange
        {
            return true
        }
    }
    
    return false
}

func part2(digits: [String], trimmed: String, letter: Character) -> Bool
{
    var occurence: Int = 0
    let length = trimmed.count

    if let pos1 = Int(digits[0]), let pos2 = Int(digits[1])
    {
        if length >= pos2
        {
            let trimmed_array = Array(trimmed)
            if trimmed_array[pos1 - 1] ==  letter
            {
                occurence += 1
            }
            if trimmed_array[pos2 - 1] == letter
            {
                occurence += 1
            }
        }
    }
    
    if occurence == 1
    {
        return true
    }


    return false
}

func main()
{
    var letter: Character = " "
    var trimmed = " "
    var digits: [String] = []
    var tally: Int = 0
    var tally2: Int = 0

    do
    {
        let contents = try  String(contentsOfFile: INPUT_FILE, encoding: .utf8)
        let lines = contents.split(separator: "\n")

        for line in lines
        {
           
            digits = line.split{ !$0.isNumber}.map { String($0)}.filter{!$0.isEmpty}

            if let colon_idx = line.firstIndex(of: ":")
            {
                letter = line[line.index(before: colon_idx)]
                let substring = line[line.index(after: colon_idx)...]
                trimmed = substring.trimmingCharacters(in: .whitespaces)
                
            }
            if evaluate(digits: digits, trimmed: trimmed, letter: letter)
            {
                tally += 1
            }
            if part2(digits: digits, trimmed: trimmed, letter: letter)
            {
                tally2 += 1
            }

        }


    }
    catch
    {
        print("Error Reading File")
    }
    print("Part 1 = \(tally)")
    print("Part 2 = \(tally2)")
}


main()