import UIKit

protocol AuthCoordinator: Coordinator {
    func openRegisterScreen()
    func closeRegisterScreen()
    func openTimeTable(token: String)
}

class AuthCoordinatorImpl: AuthCoordinator {
    private let navigationController: UINavigationController
    private let authService: AuthService
    private let completion: (_ token: String) -> Void
    
    init(
        navigationController: UINavigationController,
        authService: AuthService,
        completion: @escaping (_ token: String) -> Void
    ) {
        self.navigationController = navigationController
        self.authService = authService
        self.completion = completion
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
    
    func openTimeTable(token: String) {
        navigationController.viewControllers = []
        completion(token)
    }
}
