import Foundation

class Location: Equatable {
    
    let name: String
    let parentLocation: Location?
    
    init(name: String, parent: Location? = nil) {
        
        self.name = name
        self.parentLocation = parent
    }
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        
        return lhs.name == rhs.name && lhs.parentLocation == rhs.parentLocation
    }
}
