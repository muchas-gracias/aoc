import Foundation

class SecretEntrance {
    var current: Int = 50
    var dir: String = ""
    var zeros: Int = 0
    var zeros_pointed: Int = 0
    var min: Int = 0
    var max: Int = 99

    func direction(_ value: String){
        self.dir = String(value.prefix(1))
    }

    func get_integer(_ value: String){
        var index: Int = 1
        let number = Int(value.dropFirst())!

        if self.dir == "R" {
            while index <= number {
                if self.current + 1 <= self.max {
                    self.current += 1
                }
                else {
                    self.current = self.min
                    self.zeros_pointed += 1
                }
                index += 1
            }

        }
        else{
            while index <= number {
                if (self.current-1) >= self.min {
                    self.current -= 1
                }
                else {
                    self.current = self.max
                }
                if self.current == 0 {
                    self.zeros_pointed += 1
                }
                index += 1
            }
        }

        if self.current == 0{
            self.zeros += 1
        }

    }
}

func main(){
    let enter = SecretEntrance()


    if let contents = try? String(contentsOfFile: "details/day1.txt", encoding: .utf8) {
        let lines = contents.split(separator: "\n")

        for line in lines {
            let val = String(line)  
     
            enter.direction(val)
            enter.get_integer(val)
        }
    }
    print("Part 1", enter.zeros)
    print("Part 2", enter.zeros_pointed)
}

main()