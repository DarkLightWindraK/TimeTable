import Foundation
import PromiseKit

protocol TimeTablePresenter {
    var lessons: [Lesson] { get }
    
    func loadLessons()
    func showNextDay()
    func showPreviousDay()
    func showFiltersScreen()
}

class TimeTablePresenterImpl: TimeTablePresenter {
    var lessons: [Lesson] = []
    var delegate: TimeTableCoordinator?
    weak var viewController: TimeTableView?
    
    private let userInfoService: UserInfoService
    private let timeTableService: TimeTableService
    private let dateFormatter = DateFormatter()
    private var displayedDate: Date = .now
    private var currentFilterConfig: FilterConfig!
    
    init(
        timeTableService: TimeTableService,
        userInfoService: UserInfoService
    ) {
        self.timeTableService = timeTableService
        self.userInfoService = userInfoService
        
        dateFormatter.locale = Locale(identifier: Constants.dateFormatterLocale)
        dateFormatter.setLocalizedDateFormatFromTemplate(Constants.dateFormatterTemplate)
    }
    
    func getTimeTable() {
        firstly {
            timeTableService.getTimeTable(
                startTime: displayedDate.startOfDay.ISO8601Format(),
                endTime: displayedDate.endOfDay.ISO8601Format(),
                faculty: currentFilterConfig.faculty,
                course: currentFilterConfig.course,
                group: currentFilterConfig.group,
                subgroup: currentFilterConfig.subgroup,
                teacher: currentFilterConfig.teacher,
                room: currentFilterConfig.room
            )
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
        let userInfo = userInfoService.getSavedUserInfo()
        currentFilterConfig = FilterConfig(
            course: userInfo?.course,
            faculty: userInfo?.faculty,
            group: userInfo?.group,
            subgroup: userInfo?.subgroup ?? .all,
            room: nil,
            teacher: nil
        )
        getTimeTable()
    }
    
    func showFiltersScreen() {
        delegate?.openFiltersScreen(currentFilterConfig: currentFilterConfig)
    }
}

private extension TimeTablePresenterImpl {
    enum Constants {
        static let dayInSeconds: Double = 86400
        static let dateFormatterLocale = "ru-RU"
        static let dateFormatterTemplate = "EEE MMM d yyyy"
    }
}

private extension Date {
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
}

