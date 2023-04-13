import PromiseKit

class LoginPresenter {
    weak var viewController: LoginViewController?
    var delegate: AuthCoordinator?
    
    private let authService: AuthService
    
    init(apiClient: APIClient) {
        self.authService = AuthService(apiClient: apiClient)
    }
    
    func openRegisterScreen() {
        delegate?.openRegisterScreen()
    }
    
    func performLoginRequest(login: String, password: String) {
        firstly {
            authService.performLoginRequest(login: login, password: password)
        }.done { tokenModel in
            //TODO: обработать
        }.catch { error in
            //TODO: обработать
        }
    }
}
