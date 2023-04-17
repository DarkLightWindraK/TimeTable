import UIKit

protocol AuthCoordinator: Coordinator {
    func openRegisterScreen()
    func closeRegisterScreen()
}

class AuthCoordinatorImpl: AuthCoordinator {
    private let navigationController: UINavigationController
    private let authService: AuthService
    
    init(
        navigationController: UINavigationController,
        authService: AuthService
    ) {
        self.navigationController = navigationController
        self.authService = authService
    }
    
    func start() {
        let loginViewController = AuthViewFactory.makeLoginViewController(delegate: self, authService: authService)
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    func openRegisterScreen() {
        let registerViewController = AuthViewFactory.makeRegisterViewController(delegate: self, authService: authService)
        navigationController.pushViewController(registerViewController, animated: true)
    }
    
    func closeRegisterScreen() {
        navigationController.popViewController(animated: true)
    }
    
}
