import Foundation
import PromiseKit

protocol TimeTableService {
    func getTimeTable(
        faculty: String,
        course: Int,
        group: String,
        subgroup: Subgroup
    ) -> Promise<TimeTableResponse>
}

class TimeTableServiceImpl: TimeTableService {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getTimeTable(faculty: String, course: Int, group: String, subgroup: Subgroup) -> Promise<TimeTableResponse> {
        let params = TimeTableRequest(faculty: faculty, course: course, group: group, subgroup: subgroup)
        let resolver = TimeTableResolver(params: params)
        return apiClient.send(resolver).compactMap(\.result)
    }
}
