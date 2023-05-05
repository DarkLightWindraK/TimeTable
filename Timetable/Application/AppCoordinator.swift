import UIKit

class AppCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    private let authService: AuthService
    private let timeTableService: TimeTableService
    private let tokenService: TokenService
    
    init(
        navigationController: UINavigationController,
        authService: AuthService,
        timeTableService: TimeTableService,
        tokenService: TokenService
    ) {
        self.navigationController = navigationController
        self.authService = authService
        self.timeTableService = timeTableService
        self.tokenService = tokenService
    }
    
    func start() {
        if tokenService.validate() {
            startTimeTableFlow()
        } else {
            startAuthFlow { token in
                self.tokenService.save(token: token)
                self.startTimeTableFlow()
            }
        }
    }
}

private extension AppCoordinator {
    func startTimeTableFlow() {
        let timeTableCoordinator = CoordinatorFactory.makeTimeTableCoordinator(
            navigationController: navigationController,
            timeTableService: timeTableService
        )
        timeTableCoordinator.start()
    }
    
    func startAuthFlow(completion: @escaping (String) -> Void) {
        let authCoordinator = CoordinatorFactory.makeAuthCoordinator(
            navigationController: navigationController,
            authService: authService,
            completion: completion
        )
        authCoordinator.start()
    }
}
