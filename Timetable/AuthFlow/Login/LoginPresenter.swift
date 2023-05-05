import PromiseKit

protocol LoginPresenter {
    func openRegisterScreen()
    func performLoginRequest(login: String, password: String)
}

class LoginPresenterImpl: LoginPresenter {
    var delegate: AuthCoordinator?
    weak var viewController: LoginView?
    
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
            //TODO: подсветить красным
            return
        }
        
        firstly {
            authService.performLoginRequest(login: login, password: password)
        }.done { tokenModel in
            self.delegate?.openTimeTable(token: tokenModel.token)
        }.catch { error in
            print(error)
        }
    }
}
