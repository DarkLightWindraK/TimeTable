import UIKit

enum CoordinatorFactory {
    static func makeAuthCoordinator(
        navigationController: UINavigationController,
        authService: AuthService
    ) -> Coordinator {
        AuthCoordinatorImpl(navigationController: navigationController, authService: authService)
    }
}
