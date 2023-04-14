import UIKit

enum CoordinatorFactory {
    static func makeAuthCoordinator(
        navigationController: UINavigationController,
        authService: AuthService
    ) -> Coordinator {
        AuthCoordinator(navigationController: navigationController, authService: authService)
    }
}
