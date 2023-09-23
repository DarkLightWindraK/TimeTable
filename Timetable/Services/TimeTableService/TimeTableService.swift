import Foundation
import PromiseKit

protocol TimeTableService {
    func getTimeTable(
        startTime: String,
        endTime: String,
        faculty: String?,
        course: Int?,
        group: String?,
        subgroup: Subgroup,
        teacher: String?,
        room: String?
    ) -> Promise<TimeTableResponse>
}

class TimeTableServiceImpl: TimeTableService {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getTimeTable(
        startTime: String,
        endTime: String,
        faculty: String?,
        course: Int?,
        group: String?,
        subgroup: Subgroup,
        teacher: String?,
        room: String?
    ) -> Promise<TimeTableResponse> {
        let filter = Filter(
            startDay: startTime,
            endDay: endTime,
            faculties: faculty == nil ? [] : [faculty!],
            courses: course == nil ? [] : [course!],
            groups: group == nil ? [] : [group!],
            subgroup: subgroup,
            room: room,
            teacher: teacher
        )
        let params = TimeTableRequest(
            filter: filter
        )
        let resolver = TimeTableResolver(params: params)
        return apiClient.send(resolver).compactMap(\.result)
    }
}
