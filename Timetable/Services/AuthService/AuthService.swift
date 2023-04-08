import PromiseKit

class AuthService {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func performLoginRequest(login: String, password: String) -> Promise<TokenModel> {
        let params = CredentialsModel(login: login, password: password)
        let resolver = AuthResolver(params: params)
        return apiClient.send(resolver).compactMap(\.result)
    }
}
