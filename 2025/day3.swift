import Foundation

let filename = "details/day3.txt"

class Lobby{
    var testval_idx: Int = 0
    var prevtestval_idx: Int = 0


    func check_if_more_occurences(lst: [Int], val: Int, distance: Int, iter: Int, length: Int) -> Int {
        var duplicates: [Int] = []
        var val = val

        for (index, each) in lst.enumerated() {
            if Int(String(each)) == val {
                if iter == 0 {
                    if index >= 0 && index < length - distance {
                        duplicates.append(index)
                    }
                }
                else {
                    if index > prevtestval_idx && index < length - distance {
                        duplicates.append(index)
                    }
                }
            }
        }

        if duplicates.count > 1 {
            val = lst[duplicates[0]]  
            prevtestval_idx = duplicates[0] 
        }    
        else {
            prevtestval_idx = duplicates[0] 
        }

        return val
    }

    func start(_ lst: String, _ digits: Int) ->[Int]{

        var value: [Int] = []
        var iterations = 0
        let length = lst.count
        var distance = digits - 1

        while iterations < digits{
            var test_val = 0
            for (index, each) in lst.enumerated() {
                let num = Int(String(each)) ?? 0 
                if iterations == 0 {
                    if num >= test_val && index >= 0 && index < length - distance {
                        test_val = num
                    }
                }
                else{
                    if num >= test_val && index > prevtestval_idx && index < length - distance {
                        test_val = num                    
                        testval_idx = index
                    }
                }
            }


            let intList = lst.map { Int(String($0)) ?? 0 }

            test_val = check_if_more_occurences(
                lst: intList,
                val: test_val,
                distance: distance,
                iter: iterations,
                length: length
            )
            
            iterations += 1
            distance -= 1
            value.append(test_val)

        }
        return value      
    }
}

func main(){

    var part1_lst: [[Int]] = []

    var part2_lst: [[Int]] = []

    let contents = try! String(contentsOfFile: filename, encoding: .utf8)

    let lines = contents.components(separatedBy: .newlines)

    for each in lines {
        if each.isEmpty { continue }

        let lobby1 = Lobby()
        let value1 = lobby1.start(each, 2)
        part1_lst.append(value1)

        let lobby2 = Lobby()
        let value2 = lobby2.start(each, 12)
        part2_lst.append(value2)
    }

    let result1 = part1_lst.map { sub in
    Int(sub.map { String($0) }.joined())!
    }
    var total = result1.reduce(0, +)
    print("Part 1 =\(total)")

    let result2 = part2_lst.map { sub in
    Int(sub.map { String($0) }.joined())!
    }

    total = result2.reduce(0, +)
    print("Part 2 =\(total)")
}

main()