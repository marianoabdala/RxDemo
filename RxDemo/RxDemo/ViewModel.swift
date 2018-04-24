import Foundation
import ReactiveSwift

class ViewModel {

    let salutation = MutableProperty("Hello!")
    let firstName = MutableProperty<String?>(nil)
    let lastName = MutableProperty<String?>(nil)
    let email = MutableProperty<String?>(nil)
    let password = MutableProperty<String?>(nil)
    let isValid = MutableProperty(false)
    let isNextButtonTapped = MutableProperty(false)
    let isNextButtonEnabled = MutableProperty(false)

    init() {
        
        self.salutation <~ SignalProducer
            .combineLatest(self.firstName.producer, self.isNextButtonTapped.producer)
            .map { firstName, isNextButtonTapped -> String in
                
                if isNextButtonTapped {
                    
                    return "Good bye!"
                    
                } else {
                    
                    var salutation = "Hello"
                    
                    if let firstName = firstName {
                        
                        if firstName.characters.count > 4 {
                            
                            salutation += ", " + firstName
                            
                        }
                    }

                    return salutation + "!"
                }
            }
        
        self.isValid <~ SignalProducer
            .combineLatest(self.firstName.producer, self.lastName.producer, self.email.producer, self.password.producer)
            .map { firstName, lastName, email, password -> Bool in
                
                guard let firstName = firstName, let lastName = lastName, let email = email, let password = password else {
                    
                    return false
                }
                
                return !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty && !password.isEmpty
        }
        
    }
}
