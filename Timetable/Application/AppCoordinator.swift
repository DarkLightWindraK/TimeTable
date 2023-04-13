import UIKit

class AppCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    private let apiClient: APIClient
    
    init(
        navigationController: UINavigationController,
        apiClient: APIClient
    ) {
        self.navigationController = navigationController
        self.apiClient = apiClient
    }
    
    func start() {
        let authCoordinator = CoordinatorFactory.makeAuthCoordinator(navigationController: navigationController, apiClient: apiClient)
        authCoordinator.start()
    }
    
}
