import Foundation

protocol TokenService {
    func save(token: String)
    func getToken() -> String?
    func validate() -> Bool
}

class TokenServiceImpl: TokenService {
    
    private let storage = UserDefaults.standard
    
    func save(token: String) {
        storage.set(token, forKey: Constants.tokenKey)
        storage.set(Date(), forKey: Constants.expirationDateKey)
    }
    
    func validate() -> Bool {
        guard
            let _ = storage.string(forKey: Constants.tokenKey),
            let expirationDate = storage.object(forKey: Constants.expirationDateKey) as? Date
        else {
            return false
        }
        
        return expirationDate > Date()
    }
    
    func getToken() -> String? {
        storage.string(forKey: Constants.tokenKey)
    }
}

private extension TokenServiceImpl {
    enum Constants {
        static let tokenKey = "authToken"
        static let expirationDateKey = "tokenExpirationDate"
    }
}
