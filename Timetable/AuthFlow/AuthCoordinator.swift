import UIKit

protocol AuthCoordinator: Coordinator {
    func openLoginScreen()
    func openRegisterScreen()
}

class AuthCoordinatorImpl: AuthCoordinator {
    private let navigationController: UINavigationController
    private let authService: AuthService
    private let tokenService: TokenService
    private let onSuccessLogin: () -> Void
    
    init(
        navigationController: UINavigationController,
        authService: AuthService,
        tokenService: TokenService,
        onSuccessLogin: @escaping () -> Void
    ) {
        self.navigationController = navigationController
        self.authService = authService
        self.tokenService = tokenService
        self.onSuccessLogin = onSuccessLogin
    }
    
    func start() {
        openLoginScreen()
    }
    
    func openRegisterScreen() {
        let registerViewController = AuthViewFactory.makeRegisterViewController(
            authService: authService,
            tokenService: tokenService,
            onLoginScreenTapped: {
                self.navigationController.popViewController(animated: true)
            },
            onFinishFlow: {
                self.onSuccessLogin()
            })
        navigationController.pushViewController(registerViewController, animated: true)
    }
    
    func openLoginScreen() {
        let loginViewController = AuthViewFactory.makeLoginViewController(
            authService: authService,
            tokenService: tokenService,
            onRegisterScreenTapped: {
                self.openRegisterScreen()
            },
            onFinishFlow: {
                self.onSuccessLogin()
            })
        navigationController.pushViewController(loginViewController, animated: true)
    }
}
