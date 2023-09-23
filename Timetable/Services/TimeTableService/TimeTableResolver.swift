struct TimeTableResolver: HAPIResolver {
    
    typealias Result = TimeTableResponse
    
    var params: TimeTableRequest
    
    var endpoint: String {
        "timetable/get"
    }
}
