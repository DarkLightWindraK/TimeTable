struct AuthResolver: HAPIResolver {
    
    typealias Result = TokenModel
    
    var params: CredentialsModel
    
    var endpoint: String {
        "login"
    }
}
