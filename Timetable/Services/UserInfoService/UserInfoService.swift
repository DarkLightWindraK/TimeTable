import Foundation

struct UserInfo: Codable {
    let course: Int
    let faculty: String
    let group: String
    let subgroup: Subgroup
}

protocol UserInfoService {
    func updateUserInfo(user: UserInfo)
    func getSavedUserInfo() -> UserInfo?
}

class UserInfoServiceImpl: UserInfoService {
    
    private let storage = UserDefaults.standard
    
    func updateUserInfo(user: UserInfo) {
        let data = try? JSONEncoder().encode(user)
        storage.set(data, forKey: Constants.userInfoKey)
    }
    
    func getSavedUserInfo() -> UserInfo? {
        guard let data = storage.object(forKey: Constants.userInfoKey) as? Data else { return nil }
        
        return try? JSONDecoder().decode(UserInfo.self, from: data)
    }
}

private extension UserInfoServiceImpl {
    enum Constants {
        static let userInfoKey = "userInfo"
    }
}
