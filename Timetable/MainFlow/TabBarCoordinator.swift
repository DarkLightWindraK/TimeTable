import Foundation
import UIKit

protocol TabBarCoordinator: Coordinator { }

class TabBarCoordinatorImpl: TabBarCoordinator {
    
    private let navigationController: UINavigationController
    private let timeTableService: TimeTableService
    private let userInfoService: UserInfoService
    private let flagStorage: FlagStorage
    
    init(
        navigationController: UINavigationController,
        timeTableService: TimeTableService,
        userInfoService: UserInfoService,
        flagStorage: FlagStorage
    ) {
        self.navigationController = navigationController
        self.timeTableService = timeTableService
        self.userInfoService = userInfoService
        self.flagStorage = flagStorage
    }
    
    func start() {
        navigationController.navigationBar.isHidden = true
        if flagStorage.isFirstLaunchFlag {
            showOnboarding()
            flagStorage.isFirstLaunchFlag = false
        } else {
            showMainScreen()
        }
    }
    
    func showMainScreen() {
        let tabBarConfigurator = MainTabBarConfigurator(
            timeTableService: timeTableService,
            userInfoService: userInfoService,
            userType: .student
        )
        let tabBarController = tabBarConfigurator.configure()
        navigationController.pushViewController(tabBarController, animated: true)
    }
    
    func showOnboarding() {
        let onboardingViewController = TabBarViewFactory.createOnboardingScreen(
            userInfoService: userInfoService,
            completion: {
                self.navigationController.popViewController(animated: true)
                self.showMainScreen()
            }
        )
        onboardingViewController.navigationController?.isNavigationBarHidden = false
        navigationController.pushViewController(onboardingViewController, animated: true)
    }
}
