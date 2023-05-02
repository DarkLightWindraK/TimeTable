import Foundation

enum TimeTableViewFactory {
    static func getTimeTableViewController(
        timeTableService: TimeTableService,
        delegate: TimeTableCoordinator
    ) -> TimeTableViewController {
        let viewController = TimeTableViewController()
        let presenter = TimeTablePresenterImpl(timeTableService: timeTableService)
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.delegate = delegate
        return viewController
    }
}
