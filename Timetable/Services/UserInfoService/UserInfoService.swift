import Foundation

struct UserInfo {
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
        storage.set(user, forKey: Constants.userInfoKey)
    }
    
    func getSavedUserInfo() -> UserInfo? {
        storage.object(forKey: Constants.userInfoKey) as? UserInfo
    }
}

private extension UserInfoServiceImpl {
    enum Constants {
        static let userInfoKey = "userInfo"
    }
}
