import UIKit

protocol RegisterView: AnyObject {}

class RegisterViewController: UIViewController, RegisterView {
    var presenter: RegisterPresenter?
    
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didSignUpTap(_ sender: UIButton) {
        presenter?.performRegisterRequest(
            login: loginTextField.text ?? "",
            password: passwordTextField.text ?? "",
            confirmaton: confirmationTextField.text ?? ""
        )
    }
    
    @IBAction func didHaveAccountTap(_ sender: UIButton) {
        presenter?.closeRegisterScreen()
    }
}
