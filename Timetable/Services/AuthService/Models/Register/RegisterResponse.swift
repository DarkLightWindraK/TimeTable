struct RegisterResponse: Decodable {
    let token: String
    let userType: UserType
}
