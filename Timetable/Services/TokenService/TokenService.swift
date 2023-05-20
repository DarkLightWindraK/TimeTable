import Foundation

protocol TokenService {
    func save(token: String)
    func getToken() -> String?
    func validate() -> Bool
}

class TokenServiceImpl: TokenService {
    
    private let storage = UserDefaults.standard
    
    func save(token: String) {
        var dateComponents = DateComponents()
        dateComponents.day = 1
        
        storage.set(token, forKey: Constants.tokenKey)
        storage.set(Calendar.current.date(byAdding: dateComponents, to: Date()), forKey: Constants.expirationDate)
    }
    
    func validate() -> Bool {
        guard
            let _ = storage.string(forKey: Constants.tokenKey),
            let expirationDate = storage.object(forKey: Constants.expirationDate) as? Date
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
        static let expirationDate = "tokenExpirationDate"
    }
}
