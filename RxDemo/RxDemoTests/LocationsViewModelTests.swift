import XCTest
@testable import RxDemo
import ReactiveSwift

class LocationsViewModelTests: XCTestCase {
    
    func testCABA() {
        
        let locations = Locations()
        let viewModel = LocationsViewModel()
        
        XCTAssertEqual(viewModel.countries.value, [locations.argentina, locations.brasil, locations.uruguay])
        XCTAssertEqual(viewModel.provinces.value, [])
        XCTAssertEqual(viewModel.cities.value, [])
        
        viewModel.selectedCountry.value = locations.argentina
        
        XCTAssertEqual(viewModel.provinces.value, [locations.buenosAires, locations.cordoba, locations.santaFe])
        XCTAssertEqual(viewModel.cities.value, [])
        
        viewModel.selectedProvince.value = locations.buenosAires
        
        XCTAssertEqual(viewModel.cities.value, [locations.caba, locations.mdq])
    }
    
    func testCountryChangeWithProvinceAndCitySelected() {
        
        let locations = Locations()
        let viewModel = LocationsViewModel()
        
        viewModel.selectedCountry.value = locations.argentina
        viewModel.selectedProvince.value = locations.buenosAires
        viewModel.selectedCity.value = locations.caba

        viewModel.selectedCountry.value = locations.uruguay
        
        XCTAssertEqual(viewModel.provinces.value, [locations.colonia, locations.maldonado])
        XCTAssertEqual(viewModel.cities.value, [])

    }
}
