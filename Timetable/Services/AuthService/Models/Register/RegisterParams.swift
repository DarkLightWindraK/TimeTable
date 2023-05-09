struct RegisterParams: Encodable {
    let fullname: String
    let login: String
    let password: String
    let userType: UserType
    
    enum CodingKeys: String, CodingKey {
        case fullname = "description"
        case login
        case password
        case userType
    }
}
