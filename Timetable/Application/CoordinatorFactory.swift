import UIKit

enum CoordinatorFactory {
    static func makeAuthCoordinator(
        navigationController: UINavigationController,
        authService: AuthService,
        completion: @escaping ((String) -> Void)
    ) -> Coordinator {
        AuthCoordinatorImpl(
            navigationController: navigationController,
            authService: authService,
            completion: completion
        )
    }
    
    static func makeTimeTableCoordinator(
        navigationController: UINavigationController,
        timeTableService: TimeTableService
    ) -> Coordinator {
        TimeTableCoordinatorImpl(
            navigationController: navigationController,
            timeTableService: timeTableService
        )
    }
}
