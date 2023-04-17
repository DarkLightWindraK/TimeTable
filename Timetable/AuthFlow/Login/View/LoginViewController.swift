import UIKit

protocol LoginView: AnyObject {} 

class LoginViewController: UIViewController, LoginView {
    var presenter: LoginPresenter?
    
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openRegisterScreen(_ sender: UIButton) {
        presenter?.openRegisterScreen()
    }
    
    @IBAction func didSignInTap(_ sender: UIButton) {
        presenter?.performLoginRequest(login: loginTextField.text ?? "", password: passwordTextField.text ?? "")
    }
}
