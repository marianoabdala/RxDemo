import Foundation

class Locations {
    
    let countries: [Location]
    let provinces: [Location]
    let cities: [Location]
    
    let argentina: Location
    let brasil: Location
    let uruguay: Location
    
    let buenosAires: Location
    let cordoba: Location
    let santaFe: Location
    
    let caba: Location
    let mdq: Location
    let cordobaCapital: Location
    let rosario: Location
    
    
    init() {
        
        self.argentina = Location(name: "Argentina")
        self.brasil = Location(name: "Brasil")
        self.uruguay = Location(name: "Uruguay")
        
        self.countries = [self.argentina, self.brasil, self.uruguay]
        
        self.buenosAires = Location(name: "Buenos Aires", parent: argentina)
        self.cordoba = Location(name: "Córdoba", parent: argentina)
        self.santaFe = Location(name: "Santa Fé", parent: argentina)
        
        self.provinces = [self.buenosAires, self.cordoba, self.santaFe]
        
        self.caba = Location(name: "CABA", parent: buenosAires)
        self.mdq = Location(name: "Mar del Plata", parent: buenosAires)
        self.cordobaCapital = Location(name: "Córdoba", parent: cordoba)
        self.rosario = Location(name: "Rosario", parent: santaFe)
        
        self.cities = [self.caba, self.mdq, self.cordobaCapital, self.rosario]
    }
}
