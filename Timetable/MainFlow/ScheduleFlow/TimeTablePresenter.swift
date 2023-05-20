import Foundation
import PromiseKit

protocol TimeTablePresenter {
    var lessons: [Lesson] { get }
    
    func loadLessons()
    func showNextDay()
    func showPreviousDay()
}

class TimeTablePresenterImpl: TimeTablePresenter {
    var lessons: [Lesson] = []
    var delegate: TimeTableCoordinator?
    weak var viewController: TimeTableView?
    
    private let timeTableService: TimeTableService
    private let dateFormatter = DateFormatter()
    private var displayedDate: Date = .now
    
    init(timeTableService: TimeTableService) {
        self.timeTableService = timeTableService
        
        dateFormatter.locale = Locale(identifier: Constants.dateFormatterLocale)
        dateFormatter.setLocalizedDateFormatFromTemplate(Constants.dateFormatterTemplate)
    }
    
    func getTimeTable() {
        firstly {
            timeTableService.getTimeTable(faculty: "Faculty of Mathematics and Mechanics", course: 1, group: "MM-21", subgroup: .all)
        }.done { [weak self] response in
            self?.lessons = LessonMapper.transformToLesson(lessons: response.lessons)
            self?.viewController?.showLessons()
        }.catch { error in
            print(error)
        }
    }
    
    func showNextDay() {
        displayedDate.addTimeInterval(Constants.dayInSeconds)
        viewController?.showNewDate(date: dateFormatter.string(from: displayedDate))
    }

    func showPreviousDay() {
        displayedDate.addTimeInterval(-Constants.dayInSeconds)
        viewController?.showNewDate(date: dateFormatter.string(from: displayedDate))
    }
    
    func loadLessons() {
        viewController?.showNewDate(date: dateFormatter.string(from: displayedDate))
        getTimeTable()
    }
}

private extension TimeTablePresenterImpl {
    enum Constants {
        static let dayInSeconds: Double = 86400
        static let dateFormatterLocale = "ru-RU"
        static let dateFormatterTemplate = "EEE MMM d yyyy"
    }
}
