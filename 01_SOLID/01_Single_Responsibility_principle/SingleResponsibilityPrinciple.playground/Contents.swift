import UIKit

class Journal: CustomStringConvertible {
    
    var entries = [String]()
    var count = 0
    
    func addEntry( _ text: String) -> Int {
        count += 1
        entries.append("\(count): \(text)")
        return count - 1
    }
    
    func removeEntry( _ index: Int) {
        entries.remove(at: index)
    }
    
    var description: String {
        return entries.joined(separator: "\n")
    }
    
    func save( _ filename: String, _ overwrite: Bool = false) {
        // save to a file
    }
    
    func load( _ filename: String) {
        
    }
    
    func load( _ url: URL) {
        
    }
}

func main() {
    let j = Journal()
    let _ = j.addEntry("I cried today")
    let bug = j.addEntry("I ate a bug")
    print(j)
    
    j.removeEntry(bug)
    print("========")
    print(j)
}

main()
