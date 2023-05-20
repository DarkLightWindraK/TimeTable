struct RegisterResponse: Decodable {
    let token: String
    let user: User
}

struct User: Decodable {
    let id: String
    let type: UserType
}
