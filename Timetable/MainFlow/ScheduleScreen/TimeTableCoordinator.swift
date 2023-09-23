import Foundation
import UIKit

protocol TimeTableCoordinator: Coordinator {
    func openFiltersScreen(currentFilterConfig: FilterConfig)
    func closeFilterScreen(newFilterConfig: FilterConfig)
}

class TimeTableCoordinatorImpl: TimeTableCoordinator {
    
    private let navigationController: UINavigationController
    private let timeTableService: TimeTableService
    private let userInfoService: UserInfoService
    
    init(
        navigationController: UINavigationController,
        timeTableService: TimeTableService,
        userInfoService: UserInfoService
    ) {
        self.navigationController = navigationController
        self.timeTableService = timeTableService
        self.userInfoService = userInfoService
    }
    
    func start() {
        openTimeTableScreen()
    }
    
    func openTimeTableScreen() {
        navigationController.pushViewController(
            TimeTableViewFactory.getTimeTableViewController(
                timeTableService: timeTableService,
                userInfoService: userInfoService,
                delegate: self
            ),
            animated: true
        )
    }
    
    func openFiltersScreen(
        currentFilterConfig: FilterConfig
    ) {
        navigationController.tabBarController?.tabBar.isHidden = true
        navigationController.pushViewController(
            TimeTableViewFactory.getFiltersViewController(
                filterConfig: currentFilterConfig,
                delegate: self
            ),
            animated: true
        )
    }
    
    func closeFilterScreen(newFilterConfig: FilterConfig) {
        navigationController.tabBarController?.tabBar.isHidden = false
        navigationController.popViewController(animated: true)
    }
}
