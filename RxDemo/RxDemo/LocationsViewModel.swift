import Foundation
import ReactiveSwift

class LocationsViewModel {
    
    let countries = MutableProperty([Location]())
    let provinces = MutableProperty([Location]())
    let cities = MutableProperty([Location]())

    let selectedCountry = MutableProperty<Location?>(nil)
    let selectedProvince = MutableProperty<Location?>(nil)
    let selectedCity = MutableProperty<Location?>(nil)
    
    init() {
     
        let locations = Locations()
        
        self.countries.value = locations.countries
        
        self.provinces <~ self.selectedCountry.producer.map { country in
            
            locations.provinces.filter { $0.parentLocation == country }
        }
        
        self.cities <~ self.selectedProvince.producer.map { province in
            
            locations.cities.filter { $0.parentLocation == province }
        }
    }
}
 
