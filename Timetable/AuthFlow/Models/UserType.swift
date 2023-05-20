enum UserType: String, Codable {
    case student = "user"
    case teacher = "teacher"
    case admin = "admin"
    
    init?(rawValue: String) {
        switch rawValue {
        case "student", "user": self = .student
        case "teacher": self = .teacher
        case "admin": self = .admin
        default: return nil
        }
    }
}
