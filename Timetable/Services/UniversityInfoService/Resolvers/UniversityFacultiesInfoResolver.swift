struct UniversityFacultiesInfoResolver: HAPIResolver {
    
    typealias Result = TimeTableResponse
    
    var params: TimeTableRequest
    
    var endpoint: String {
        "get-list-faculties"
    }
}
