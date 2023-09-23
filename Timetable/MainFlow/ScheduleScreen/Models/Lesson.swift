struct Lesson {
    let number: Int
    let beginOfLesson: String
    let endOfLesson: String
    let room: String
    let name: String
    let teacher: String
    
    init(number: Int, beginOfLesson: String, endOfLesson: String, room: String, name: String, teacher: String) {
        self.number = number
        let time = Lesson.numberToTime(number: number)
        self.beginOfLesson = time.begin
        self.endOfLesson = time.end
        self.room = room
        self.name = name
        self.teacher = teacher
    }
}

private extension Lesson {
    static func numberToTime(number: Int) -> (begin: String, end: String) {
        switch number {
        case 1:
            return ("8:00", "9:45")
        case 2:
            return ("9:45", "11:20")
        case 3:
            return ("11:30", "13:05")
        case 4:
            return ("13:25", "15:00")
        case 5:
            return ("15:10", "16:45")
        case 6:
            return ("16:55", "18:30")
        case 7:
            return ("18:40", "20:00")
        default:
            return ("", "")
        }
    }
}
