import Foundation

enum TimeTableViewFactory {
    static func getTimeTableViewController(
        timeTableService: TimeTableService,
        userInfoService: UserInfoService,
        delegate: TimeTableCoordinator
    ) -> TimeTableViewController {
        let viewController = TimeTableViewController()
        let presenter = TimeTablePresenterImpl(
            timeTableService: timeTableService,
            userInfoService: userInfoService
        )
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.delegate = delegate
        return viewController
    }
    
    static func getFiltersViewController(
        filterConfig: FilterConfig,
        delegate: TimeTableCoordinator
    ) -> FilterViewController {
        let viewController = FilterViewController()
        let presenter = FilterPresenter(config: filterConfig)
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.delegate = delegate
        return viewController
    }
}
