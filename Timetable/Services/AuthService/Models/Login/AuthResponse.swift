struct AuthResponse: Decodable {
    let token: String
    let user: User
}
