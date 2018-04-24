import XCTest
@testable import RxDemo
import ReactiveSwift

class RxDemoTests: XCTestCase {
    
    func testInitial() {
        
        let viewModel = ViewModel()
        
        XCTAssertEqual(viewModel.salutation.value, "Hello!")
        XCTAssertFalse(viewModel.isValid.value)
    }
    
    func testShortName() {
        
        let viewModel = ViewModel()
        
        viewModel.firstName.value = "ABCD"
        
        XCTAssertEqual(viewModel.salutation.value, "Hello!")
    }
    
    func testLongName() {
        
        let viewModel = ViewModel()
        
        viewModel.firstName.value = "ABCDE"
        
        XCTAssertEqual(viewModel.salutation.value, "Hello, ABCDE!")
    }
    
    func testInvalid() {

        let viewModel = ViewModel()
        
        XCTAssertFalse(viewModel.isValid.value)

        viewModel.firstName.value = "Mariano"
        XCTAssertFalse(viewModel.isValid.value)

        viewModel.lastName.value = "Abdala"
        XCTAssertFalse(viewModel.isValid.value)

        viewModel.email.value = "mariano.abdala@contractor.siplay.com"
        XCTAssertFalse(viewModel.isValid.value)

        viewModel.password.value = "siptest123"
        XCTAssertTrue(viewModel.isValid.value)
        
        viewModel.firstName.value = nil
        XCTAssertFalse(viewModel.isValid.value)
        
        viewModel.firstName.value = "Mariano"
        viewModel.lastName.value = nil
        XCTAssertFalse(viewModel.isValid.value)
        
        viewModel.lastName.value = "Abdala"
        viewModel.email.value = nil
        XCTAssertFalse(viewModel.isValid.value)

        viewModel.email.value = "mariano.abdala@contractor.siplay.com"
        viewModel.password.value = nil
        XCTAssertFalse(viewModel.isValid.value)

        viewModel.password.value = "siptest123"
        XCTAssertTrue(viewModel.isValid.value)
    }
    
    func testValid() {
        
        let viewModel = ViewModel()
        
        viewModel.firstName.value = "Mariano"
        viewModel.lastName.value = "Abdala"
        viewModel.email.value = "mariano.abdala@contractor.siplay.com"
        viewModel.password.value = "siptest123"
        
        XCTAssertTrue(viewModel.isValid.value)
    }
    
    func testNext() {
        
        let viewModel = ViewModel()
        
        viewModel.firstName.value = "Mariano"
        viewModel.lastName.value = "Abdala"
        viewModel.email.value = "mariano.abdala@contractor.siplay.com"
        viewModel.password.value = "siptest123"
        viewModel.isNextButtonTapped.value = true
        
        XCTAssertEqual(viewModel.salutation.value, "Good bye!")
    }
}
