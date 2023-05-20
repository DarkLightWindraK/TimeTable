import UIKit

protocol RegisterView: AnyObject {}

class RegisterViewController: UIViewController, RegisterView {
    var presenter: RegisterPresenter?
    
    @IBOutlet private weak var fullnameTextField: UITextField!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmationTextField: UITextField!
    @IBOutlet private weak var userTypeSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didSignUpTap(_ sender: UIButton) {
        presenter?.performRegisterRequest(
            fullname: fullnameTextField.text ?? "",
            login: loginTextField.text ?? "",
            password: passwordTextField.text ?? "",
            confirmaton: confirmationTextField.text ?? "",
            userType: UserType(rawValue: userTypeSegment.titleForSegment(at: userTypeSegment.selectedSegmentIndex)!.lowercased())!
        )
    }
    
    @IBAction func didHaveAccountTap(_ sender: UIButton) {
        presenter?.closeRegisterScreen()
    }
}
