struct AuthResponse: Decodable {
    let token: String
    let userType: UserType
}
