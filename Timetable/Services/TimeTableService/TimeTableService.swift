import Foundation
import PromiseKit

protocol TimeTableService {
    func getTimeTable(
        faculty: String,
        course: Int,
        group: String,
        subgroup: Subgroup
    ) -> Promise<[Lesson]>
}

class TimeTableServiceImpl: TimeTableService {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getTimeTable(faculty: String, course: Int, group: String, subgroup: Subgroup) -> PromiseKit.Promise<[Lesson]> {
        let params = TimeTableRequest(faculty: faculty, course: course, group: group, subgroup: subgroup)
        let resolver = TimeTableResolver(params: params)
        return apiClient.send(resolver).compactMap(\.result)
    }
}
