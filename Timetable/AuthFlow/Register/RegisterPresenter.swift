import PromiseKit

class RegisterPresenter {
    var delegate: AuthCoordinator?
    
    weak var viewController: RegisterViewController?
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func closeRegisterScreen() {
        delegate?.closeRegisterScreen()
    }
    
    func performRegisterRequest(login: String, password: String, confirmaton: String) {
        guard
            !login.isEmpty,
            !password.isEmpty,
            !confirmaton.isEmpty,
            password == confirmaton
        else {
            //TODO: подсветить красным
            return
        }
        
        firstly {
            authService.performLoginRequest(login: login, password: password) //TODO: поменять ручку
        }.done { tokenModel in
            //TODO: обработать
        }.catch { error in
            //TODO: обработать
        }
    }
}
