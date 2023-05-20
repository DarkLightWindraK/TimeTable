import Foundation
import UIKit

protocol TimeTableCoordinator: Coordinator {
    
}

class TimeTableCoordinatorImpl: TimeTableCoordinator {
    
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
        navigationController.pushViewController(
            TimeTableViewFactory.getTimeTableViewController(
                timeTableService: timeTableService,
                delegate: self
            ),
            animated: true
        )
    }
}
