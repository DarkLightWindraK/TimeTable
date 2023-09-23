import Foundation

struct FilterConfig {
    let course: Int?
    let faculty: String?
    let group: String?
    let subgroup: Subgroup
    let room: String?
    let teacher: String?
    
    init(course: Int?, faculty: String?, group: String?, subgroup: Subgroup = .all, room: String?, teacher: String?) {
        self.course = course
        self.faculty = faculty
        self.group = group
        self.subgroup = subgroup
        self.room = room
        self.teacher = teacher
    }
}
