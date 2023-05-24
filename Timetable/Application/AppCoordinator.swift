import UIKit

class AppCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    private let authService: AuthService
    private let timeTableService: TimeTableService
    private let tokenService: TokenService
    private let flagStorage: FlagStorage
    
    init(
        navigationController: UINavigationController,
        authService: AuthService,
        timeTableService: TimeTableService,
        tokenService: TokenService,
        flagStorage: FlagStorage
    ) {
        self.navigationController = navigationController
        self.authService = authService
        self.timeTableService = timeTableService
        self.tokenService = tokenService
        self.flagStorage = flagStorage
    }
    
    func start() {
        if tokenService.validate() {
            startMainFlow()
        } else {
            startAuthFlow()
        }
    }
}

private extension AppCoordinator {
    func startMainFlow() {
        let tabBarCoordinator = CoordinatorFactory.makeTabBarCoordinator(
            navigationController: navigationController,
            timeTableService: timeTableService,
            flagStorage: flagStorage
        )
        tabBarCoordinator.start()
    }
    
    func startAuthFlow() {
        let authCoordinator = CoordinatorFactory.makeAuthCoordinator(
            navigationController: navigationController,
            authService: authService,
            tokenService: tokenService,
            onFinishFlow: {
                self.navigationController.viewControllers.removeAll()
                self.startMainFlow()
            })
        authCoordinator.start()
    }
}
