//
//  Record.swift
//  03_CVC
//
//  Created by Роман on 22.05.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import Foundation
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
    
    var favorite : Bool = false
    
    var image: UIImage? = nil
    
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
    deinit {
        print("Record deleted")
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
