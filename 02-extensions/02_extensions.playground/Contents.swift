// LITS HOMEWORK 2 - EXTENSIONS

import UIKit

extension Array where Element: Equatable{
    mutating func removeElement (element: Element){
        
        guard let index = self.index(of: element) else { return }
        
        self.remove(at: index)
        
    }
    
    mutating func safeRemoval (index: Int){
        if (index >= 0) && (index < self.count) {
            self.remove(at: index)
        }
    }
}

var a = [1,2,3,4,5,6,7]
print (a.description)

a.removeElement(element: 5)
print (a.description)

a.safeRemoval(index: 5)
print (a.description)

a.safeRemoval(index: -3)
print (a.description)
