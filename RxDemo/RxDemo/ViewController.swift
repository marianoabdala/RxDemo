import UIKit
import ReactiveSwift
import ReactiveCocoa

class ViewController: UITableViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.headerLabel.reactive.text <~ self.viewModel.salutation
        self.nextButton.reactive.isEnabled <~ self.viewModel.isValid

        self.viewModel.firstName <~ self.firstNameTextField.reactive.continuousTextValues
        self.viewModel.lastName <~ self.lastNameTextField.reactive.continuousTextValues
        self.viewModel.email <~ self.emailTextField.reactive.continuousTextValues
        self.viewModel.password <~ self.passwordTextField.reactive.continuousTextValues
        
        self.viewModel.isNextButtonTapped <~ self.nextButton.reactive.controlEvents(.touchUpInside).map { _ in return true }
    }
}
