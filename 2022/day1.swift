import Foundation

let INPUT_FILE: String = "details/day1.txt"

func check_lst(lst: inout [Int], count: Int)
{
    
    for (index, element) in lst.enumerated()
    {
        if count > element
        {
            lst.insert(count, at: index)
            lst.removeLast()
            break
        }
    }

    return
}

func main() 
{
    var count: Int = 0
    var lst: [Int] = [0, 0, 0]

    do 
    {
        let contents = try String(contentsOfFile: INPUT_FILE, encoding: .utf8)
        for line in contents.split(separator: "\n", omittingEmptySubsequences: false) 
        {
            let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
            if trimmed.isEmpty 
            {
                check_lst(lst: &lst, count: count)
                count = 0
                continue
            }

            if let number = Int(trimmed) 
            {
                count += number
            }
        }
    } 

    catch 
    {
        print("Error: \(error.localizedDescription)")
    }
    
    let total = lst.reduce(0 , +)

    print("Part 1 = \(lst[0])")
    print("Part 2 = \(total)")
}

main()
