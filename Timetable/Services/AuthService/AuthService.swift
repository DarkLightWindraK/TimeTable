import PromiseKit

protocol AuthService {
    func performLoginRequest(login: String, password: String) -> Promise<AuthResponse>
}

class AuthServiceImpl: AuthService {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func performLoginRequest(
        login: String,
        password: String
    ) -> Promise<AuthResponse> {
        let params = Credentials(login: login, password: password)
        let resolver = AuthResolver(params: params)
        return apiClient.send(resolver).compactMap(\.result)
    }
}
