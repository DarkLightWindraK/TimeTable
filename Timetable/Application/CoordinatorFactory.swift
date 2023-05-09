import UIKit

enum CoordinatorFactory {
    static func makeAuthCoordinator(
        navigationController: UINavigationController,
        authService: AuthService,
        tokenService: TokenService,
        onFinishFlow: @escaping () -> Void
    ) -> Coordinator {
        AuthCoordinatorImpl(
            navigationController: navigationController,
            authService: authService,
            tokenService: tokenService,
            onSuccessLogin: onFinishFlow
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
