import PromiseKit

protocol RegisterPresenter {
    func closeRegisterScreen()
    func performRegisterRequest(
        fullname: String,
        login: String,
        password: String,
        confirmaton: String,
        userType: UserType
    )
}

class RegisterPresenterImpl: RegisterPresenter {
    weak var viewController: RegisterView?
    var onFinishFlow: (() -> Void)?
    var onLoginScreenTapped: (() -> Void)?
    
    private let authService: AuthService
    private let tokenService: TokenService
    
    init(
        authService: AuthService,
        tokenService: TokenService
    ) {
        self.authService = authService
        self.tokenService = tokenService
    }
    
    func closeRegisterScreen() {
        onLoginScreenTapped?()
    }
    
    func performRegisterRequest(
        fullname: String,
        login: String,
        password: String,
        confirmaton: String,
        userType: UserType
    ) {
        guard
            !fullname.isEmpty,
            !login.isEmpty,
            !password.isEmpty,
            !confirmaton.isEmpty,
            password == confirmaton
        else {
            //TODO: подсветить красным
            return
        }
        
        firstly {
            authService.performRegisterRequest(
                fullname: fullname,
                login: login,
                password: password,
                userType: userType
            )
        }.done { [weak self] response in
            self?.tokenService.save(token: response.token)
            self?.onFinishFlow?()
        }.catch { error in
            print(error)
        }
    }
}
