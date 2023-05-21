import Foundation
import UIKit

protocol TabBarCoordinator: Coordinator { }

class TabBarCoordinatorImpl: TabBarCoordinator {
    
    private let navigationController: UINavigationController
    private let timeTableService: TimeTableService
    
    init(
        navigationController: UINavigationController,
        timeTableService: TimeTableService
    ) {
        self.navigationController = navigationController
        self.timeTableService = timeTableService
    }
    
    func start() {
        let tabBarConfigurator = MainTabBarConfigurator(
            timeTableService: timeTableService,
            userType: .student
        )
        let tabBarController = tabBarConfigurator.configure()
        navigationController.pushViewController(tabBarController, animated: true)
    }
}
