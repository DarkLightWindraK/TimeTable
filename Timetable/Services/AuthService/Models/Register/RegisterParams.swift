struct UserCredentials: Encodable {
    let login: String
    let password: String
}

struct RegisterParams: Encodable {
    let fullname: String
    let userCredetials: UserCredentials
    let userType: UserType
    
    enum CodingKeys: String, CodingKey {
        case fullname = "description"
        case userCredetials = "user_credentials"
        case userType
    }
}
