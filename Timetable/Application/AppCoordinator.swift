import UIKit

class AppCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    private let authService: AuthService
    private let timeTableService: TimeTableService
    
    init(
        navigationController: UINavigationController,
        authService: AuthService,
        timeTableService: TimeTableService
    ) {
        self.navigationController = navigationController
        self.authService = authService
        self.timeTableService = timeTableService
    }
    
    func start() {
        let authCoordinator = CoordinatorFactory.makeAuthCoordinator(
            navigationController: navigationController,
            authService: authService
        )
        authCoordinator.start()
    }
    
}
