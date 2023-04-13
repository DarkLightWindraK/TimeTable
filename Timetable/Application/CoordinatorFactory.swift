import UIKit

enum CoordinatorFactory {
    static func makeAuthCoordinator(
        navigationController: UINavigationController,
        apiClient: APIClient
    ) -> Coordinator {
        AuthCoordinator(navigationController: navigationController, apiClient: apiClient)
    }
}
