// LITS HOMEWORK 2 - EXTENSIONS

import UIKit

extension Array where Element: Equatable{
    mutating func removeElement (element: Element){
        
        guard let index = self.index(of: element) else { return }
        
        self.remove(at: index)
        
    }
}

var a = [1,2,3,4,5,6,7]

a.append(11)
a.removeElement(element: 5)

