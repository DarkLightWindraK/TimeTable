struct TimeTableResolver: HAPIResolver {
    
    typealias Result = [Lesson]
    
    var params: TimeTableRequest
    
    var endpoint: String {
        "get-timetable"
    }
}
