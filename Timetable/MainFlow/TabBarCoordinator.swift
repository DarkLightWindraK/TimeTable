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
        let tabBarController = MainTabBarConfigurator.configure(timeTableService: timeTableService)
        navigationController.pushViewController(tabBarController, animated: true)
    }
}
