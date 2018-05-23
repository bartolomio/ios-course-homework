import UIKit

class Record {
    
    let date: Date
    
    var name: String? {
        didSet{
            print ("[LOG MESSAGE] New name \"\(self.name ?? "nil")\" is set. Record \(String(describing: self)). Old value \"\(oldValue ?? "nil")\"")
        }
    }
    var text: String?{
        didSet{
            print ("[LOG MESSAGE] New name \"\(self.text ?? "nil")\" is set. Record \(String(describing: self)). Old value \"\(oldValue ?? "nil")\"")
        }
    }
    var tags: [String] = [String](){
        didSet{
            print ("[LOG MESSAGE] New text \"\(tags)\" is set for Record \(String(describing: self)). Old value \"\(oldValue)\"")
        }
    }

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
        
        print ("[LOG MESSAGE] New record \(String(describing: self)) created. Name = \"\(self.name ?? "nil")\". Tags = \"\(self.tags)\". Text = \"\(self.text ?? "nil")\".")
    }
    
    convenience init? (date: Date, name: String? = nil, text: String? = nil, tags: String? = nil ) {
        if date != Date() {
            print ("[LOG MESSAGE] Record not created due to wrong date")
            return nil
        } else {
            self.init(name: name, text: text, tags: tags)
        }
    }
    
    func addTag (tag: String){
        self.tags.append(tag)
    }
    
    func remTag (tag: String){
        if self.tags.contains(tag) {
            self.tags.remove(at: self.tags.index(of: tag)!)
        } else {
            print ("No such tag")
        }
    }
    
    func tagsAsString () -> String?{
        var result: String = ""
        for tag in self.tags {
            result = result + tag + ","
        }
        if result.count > 0 {
            result.removeLast()
            return result
        } else {
            return nil
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
record.name = "First record"
record.tags.append("11")
record.tags.append("12")
record.addTag(tag: "13")
record.remTag(tag: "12")
record.remTag(tag: "12")
record.text = "Text of the first record"
print (record.description())

var b: Record = Record(name:"Second record", text:"Text of the second record", tags:"21,22,23,24")
print(b.description())

var c: Record? = Record(date: Date(timeIntervalSince1970: 0), name: "Third record", text: "Text of the third record", tags: "31,32,33,34")

var d: Record = Record()
print(d.description())

var e: Record = Record(name:"Fifth record")
print(e.description())

var f: Record = Record(text:"Text of the sixth record")
print(f.description())
print (f.tagsAsString() ?? "nil")
