import Foundation

enum Subgroup: String, Encodable {
    case first = "first", second = "second", all = "all"
}

struct TimeTableRequest: Encodable {
    let faculty: String
    let course: Int
    let group: String
    let subgroup: Subgroup
    
    enum CodingKeys: String, CodingKey {
        case faculty = "faculty_name"
        case course = "group_course"
        case group = "group_name"
        case subgroup
    }
}
