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
        timeTableService: TimeTableService,
        userInfoService: UserInfoService
    ) -> Coordinator {
        TimeTableCoordinatorImpl(
            navigationController: navigationController,
            timeTableService: timeTableService,
            userInfoService: userInfoService
        )
    }
    
    static func makeTabBarCoordinator(
        navigationController: UINavigationController,
        timeTableService: TimeTableService,
        userInfoService: UserInfoService,
        flagStorage: FlagStorage
    ) -> Coordinator {
        TabBarCoordinatorImpl(
            navigationController: navigationController,
            timeTableService: timeTableService,
            userInfoService: userInfoService,
            flagStorage: flagStorage
        )
    }
}
