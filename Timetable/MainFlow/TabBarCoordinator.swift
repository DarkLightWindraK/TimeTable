import Foundation
import UIKit

protocol TabBarCoordinator: Coordinator { }

class TabBarCoordinatorImpl: TabBarCoordinator {
    
    private let navigationController: UINavigationController
    private let timeTableService: TimeTableService
    private let flagStorage: FlagStorage
    
    init(
        navigationController: UINavigationController,
        timeTableService: TimeTableService,
        flagStorage: FlagStorage
    ) {
        self.navigationController = navigationController
        self.timeTableService = timeTableService
        self.flagStorage = flagStorage
    }
    
    func start() {
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
            userType: .student
        )
        let tabBarController = tabBarConfigurator.configure()
        navigationController.pushViewController(tabBarController, animated: true)
    }
    
    func showOnboarding() {
        let onboardingViewController = TabBarViewFactory.createOnboardingScreen()
        onboardingViewController.navigationController?.isNavigationBarHidden = false
        navigationController.pushViewController(onboardingViewController, animated: true)
    }
}
