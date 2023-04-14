import PromiseKit

class LoginPresenter {
    var delegate: AuthCoordinator?
    
    weak var viewController: LoginViewController?
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func openRegisterScreen() {
        delegate?.openRegisterScreen()
    }
    
    func performLoginRequest(login: String, password: String) {
        guard
            !login.isEmpty,
            !password.isEmpty
        else {
            return
        }
        
        firstly {
            authService.performLoginRequest(login: login, password: password)
        }.done { tokenModel in
            //TODO: обработать
        }.catch { error in
            //TODO: обработать
        }
    }
}
