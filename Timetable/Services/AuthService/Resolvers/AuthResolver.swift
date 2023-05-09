struct AuthResolver: HAPIResolver {
    
    typealias Result = AuthResponse
    
    var params: AuthParams
    
    var endpoint: String {
        "login"
    }
}
