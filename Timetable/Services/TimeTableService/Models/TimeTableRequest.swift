import Foundation

enum Subgroup: String, Codable {
    case first = "first", second = "second", all = "all"
}

struct Filter: Encodable {
    let startDay: String
    let endDay: String
    let faculties: [String]
    let courses: [Int]
    let groups: [String]
    let subgroup: Subgroup
    let room: String?
    let teacher: String?
    
    enum CodingKeys: String, CodingKey {
        case faculties = "faculty_names"
        case courses = "group_courses"
        case groups = "group_names"
        case startDay = "begin"
        case endDay = "end"
        case subgroup, room, teacher
    }
}

struct TimeTableRequest: Encodable {
    let filter: Filter
}
