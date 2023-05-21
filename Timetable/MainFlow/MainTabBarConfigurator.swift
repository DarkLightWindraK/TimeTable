import Foundation
import UIKit

class MainTabBarConfigurator {
    
    private let timeTableService: TimeTableService
    private let userType: UserType
    private var tabs: [TabBarModel] = []
    
    init(
        timeTableService: TimeTableService,
        userType: UserType
    ) {
        self.timeTableService = timeTableService
        self.userType = userType
    }
    
    func configure() -> UITabBarController {
        getTabBar()
    }
}

private extension MainTabBarConfigurator {
    func getTabBar() -> UITabBarController {
        let tabBarController = UITabBarController()
        
        setAvailableTabs()
        
        tabBarController.viewControllers = tabs.map {
            setFlowForTab(tab: $0)
        }
        return tabBarController
    }
    
    func setAvailableTabs() {
        switch userType {
        case .student:
            tabs = [.timeTable]
        case .teacher:
            tabs = [.timeTable]
        case .admin:
            tabs = [.timeTable]
        }
    }
    
    func setFlowForTab(tab: TabBarModel) -> UIViewController {
        let flow = UINavigationController()
        flow.tabBarItem = UITabBarItem(
            title: tab.title,
            image: tab.image,
            selectedImage: tab.selectedImage
        )
        
        var coordinator: Coordinator
        switch tab {
        case .timeTable:
            coordinator = CoordinatorFactory.makeTimeTableCoordinator(
                navigationController: flow,
                timeTableService: timeTableService
            )
        }
        coordinator.start()
        return flow
    }
}
