struct RegisterResolver: HAPIResolver {
    
    typealias Result = RegisterResponse
    
    var params: RegisterParams
    
    var endpoint: String {
        "register"
    }
}
