import UIKit

class AuthCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    private let apiClient: APIClient
    
    init(navigationController: UINavigationController, apiClient: APIClient) {
        self.navigationController = navigationController
        self.apiClient = apiClient
    }
    
    func start() {
        let loginViewController = AuthViewFactory.makeLoginViewController(delegate: self, apiClient: apiClient)
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    func openRegisterScreen() {
        let registerViewController = AuthViewFactory.makeRegisterViewController()
        navigationController.pushViewController(registerViewController, animated: true)
    }
    
}
