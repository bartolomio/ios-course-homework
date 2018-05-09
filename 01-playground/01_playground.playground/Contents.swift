import UIKit

// use optional in the homework

class Record {
    
    let date: Date
    
    var name: String?
    var text: String?
    var tags: [String] = [String]()
    init(name: String? = nil, text: String? = nil, tags: String? = nil) {
        self.date = Date()
        
        if let _: String = name {
            self.name = name
        }
        if let _: String = text {
            self.text = text
        }
        if let _: String = tags {
            self.tags = tags!.components(separatedBy: ",")
        }
    }
    
    convenience init? (date: Date, name: String? = nil, text: String? = nil, tags: String? = nil ) {
        if date != Date() {
            return nil
        } else {
            self.init(name: name, text: text, tags: tags)
        }
    }

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

record.name = "ololo"
record.tags.append("1")
record.tags.append("2")
record.text = "finish it"
print (record.description())

var b: Record = Record(name:"lol", text:"123", tags:"1,2,3,4")
print(b.description())

var c: Record? = Record(date: Date(timeIntervalSince1970: 0), name: "222", text: "333", tags: "3,4,5")
