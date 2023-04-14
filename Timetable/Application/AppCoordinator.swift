import UIKit

class AppCoordinator: Coordinator {
    
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
        let authCoordinator = CoordinatorFactory.makeAuthCoordinator(navigationController: navigationController, authService: authService)
        authCoordinator.start()
    }
    
}
