struct AuthResolver: HAPIResolver {
    
    typealias Result = AuthResponse
    
    var params: Credentials
    
    var endpoint: String {
        "login"
    }
}
