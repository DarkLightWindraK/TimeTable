import PromiseKit

protocol LoginPresenter {
    func openRegisterScreen()
    func performLoginRequest(login: String, password: String)
}

class LoginPresenterImpl: LoginPresenter {
    weak var viewController: LoginView?
    var onFinishFlow: (() -> Void)?
    var onRegisterScreenTapped: (() -> Void)?
    
    private let authService: AuthService
    private let tokenService: TokenService
    
    init(
        authService: AuthService,
        tokenService: TokenService
    ) {
        self.authService = authService
        self.tokenService = tokenService
    }
    
    func openRegisterScreen() {
        onRegisterScreenTapped?()
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
        }.done { [weak self] response in
            self?.tokenService.save(token: response.token)
            self?.onFinishFlow?()
        }.catch { error in
            print(error)
        }
    }
}
