import Foundation

let INPUT_FILE: String = "details/day2_samp.txt"

func main() {
    var lst: [[String]] = []

    do {
        let contents = try String(contentsOfFile: INPUT_FILE, encoding: String.Encoding.utf8)  // Correct usage of String.Encoding.utf8
        let lines = contents.split(separator: "\n")
        for line in lines {
            let components = line.split(separator: " ")
            let componentsList = components.map { String($0) }
            lst.append(componentsList)
        }
    } catch {
        print("Error: \(error.localizedDescription)")  // Detailed error message
    }

    // Print the result to verify
    print(lst)
}

main()
