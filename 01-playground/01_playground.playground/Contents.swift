import UIKit

// use optional in the homework

class Record {
    
    let date: Date = Date()
    
    var name: String?
    var text: String?
    var tags: [String] = [String]()
    
    func description() -> String {
        //Add data to result string
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "uk_UA")
        var result: String = dateFormatter.string(from: self.date)
        
        //Add name to result string
        if self.name != nil {
            result = result + "\n" + self.name!
        }
        
        //Add tags to result string
        var tagString: String?
        if tags.capacity > 0 {
            tagString = ""
            for tag in tags {
                tagString = tagString! + "[" + tag + "]"
            }
            result = result + "\n" + tagString!
        }
        
        //Add text to result string
        if self.text != nil {
            result = result + "\n" + self.text!
        }
        return result
    }
}


var record: Record = Record()

//record.name = "ololo"
//record.tags.append("1")
//record.tags.append("2")
record.text = "finish it"
print (record.description())


