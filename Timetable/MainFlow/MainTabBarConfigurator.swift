import Foundation
import UIKit

enum MainTabBarConfigurator {
    
    static func configure(
        timeTableService: TimeTableService
    ) -> UITabBarController {
        let tabBarController = UITabBarController()
        
        let timeTableFlowNavigation = UINavigationController()
        timeTableFlowNavigation.tabBarItem = UITabBarItem(
            title: Constants.timeTableItemName,
            image: Constants.timeTableItemImage,
            selectedImage: nil
        )
        let timeTableCoordinator = CoordinatorFactory.makeTimeTableCoordinator(
            navigationController: timeTableFlowNavigation,
            timeTableService: timeTableService
        )
        timeTableCoordinator.start()
        
        tabBarController.viewControllers = [timeTableFlowNavigation]
        
        return tabBarController
    }
}

private extension MainTabBarConfigurator {
    enum Constants {
        static let timeTableItemName = "Расписание"
        static let timeTableItemImage = UIImage(systemName: "note.text")
    }
}
