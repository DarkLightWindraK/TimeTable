import Foundation

struct LessonModel: Decodable {
    let number: Int
    let beginOfLesson: String
    let endOfLesson: String
    let room: String
    let name: String
    let teacher: String
    
    enum CodingKeys: String, CodingKey {
        case beginOfLesson = "begin"
        case endOfLesson = "end"
        case room = "room_name"
        case name = "subject_name"
        case teacher = "teacher_fio"
        case number
    }
}

struct TimeTableResponse: Decodable {
    let lessons: [LessonModel]
}
