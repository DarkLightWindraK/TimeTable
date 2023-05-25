import UIKit

class AppCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    private let authService: AuthService
    private let timeTableService: TimeTableService
    private let tokenService: TokenService
    private let userInfoService: UserInfoService
    private let flagStorage: FlagStorage
    
    init(
        navigationController: UINavigationController,
        authService: AuthService,
        timeTableService: TimeTableService,
        tokenService: TokenService,
        userInfoService: UserInfoService,
        flagStorage: FlagStorage
    ) {
        self.navigationController = navigationController
        self.authService = authService
        self.timeTableService = timeTableService
        self.tokenService = tokenService
        self.userInfoService = userInfoService
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
            userInfoService: userInfoService,
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
