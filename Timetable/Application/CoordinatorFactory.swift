import UIKit

enum CoordinatorFactory {
    static func makeAuthCoordinator(
        navigationController: UINavigationController,
        authService: AuthService
    ) -> Coordinator {
        AuthCoordinatorImpl(navigationController: navigationController, authService: authService)
    }
    
    static func makeTimeTableCoordinator(
        navigationController: UINavigationController,
        timeTableService: TimeTableService
    ) -> Coordinator {
        TimeTableCoordinatorImpl(navigationController: navigationController, timeTableService: timeTableService)
    }
}
