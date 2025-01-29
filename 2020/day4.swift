import Foundation



let INPUT_FILE = "details/day4.txt"

func analyze(groups: [String])
{
    for j in groups
    {
        for i in j
        {
            print(i)
            print("----")
        }
        
    }
}
func main()
{
    var groups:[String] = []
    do
    {
        let contents = try String(contentsOfFile: INPUT_FILE, encoding: .utf8)
        groups = contents.components(separatedBy: "\n\n")
    
    }
    catch
    {
        print("error: \(error.localizedDescription)")
    }

    analyze(groups:groups)
}

main()