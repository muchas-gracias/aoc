import Foundation

let INPUT_FILE = "details/day1.txt"




func compare_three_numbers(lst: [Int]) -> Int
{
    // var ret_value: Int = 0
    var test_lst: [Int] = []

    for idx in lst
    {
        for jdx in lst
        {
            if jdx != idx
            {
                for kdx in lst
                {
                    if kdx != jdx && kdx != idx
                    {
                        if idx + jdx + kdx == 2020
                        {
                            test_lst.append(idx)
                            test_lst.append(jdx)
                            test_lst.append(kdx)
                            return (idx * jdx * kdx)
                        }
                    }
                }
            }
        }
    }

    return 0
}
func compare_two_numbers(lst: [Int]) -> Int
{
    var test: Int
    var ret_value: Int = 0

    for each in lst
    {
        test = each
        for idx in lst
        {
            if idx != test
            {
                if idx + test == 2020
                {
                    ret_value = idx * test
                }
            }
        }
    
    }
    return ret_value
}

func main()
{
    var lst: [Int] = []
    var value1: Int = 0
    var value2: Int = 0

    do
    {
        let contents = try String(contentsOfFile: INPUT_FILE, encoding: .utf8)
        for line in contents.split(separator: "\n", omittingEmptySubsequences: false)
        {
           if let number = Int(line)
           {
               lst.append(number)
           }
        }
    }
    catch
    {
        print("Error: \(error.localizedDescription)")
    }

    value1 = compare_two_numbers(lst:lst)
    value2 = compare_three_numbers(lst: lst)
    print(value1)
    print(value2)

}

main()