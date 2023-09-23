import PromiseKit

protocol AuthService {
    func performLoginRequest(
        login: String,
        password: String
    ) -> Promise<AuthResponse>
    
    func performRegisterRequest(
        fullname: String,
        login: String,
        password: String,
        userType: UserType
    ) -> Promise<RegisterResponse>
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
        let params = AuthParams(login: login, password: password)
        let resolver = AuthResolver(params: params)
        return apiClient.send(resolver).compactMap(\.result)
    }
    
    func performRegisterRequest(
        fullname: String,
        login: String,
        password: String,
        userType: UserType
    ) -> Promise<RegisterResponse> {
        let credentials = UserCredentials(login: login, password: password)
        let params = RegisterParams(
            fullname: fullname,
            userCredetials: credentials,
            userType: userType
        )
        let resolver = RegisterResolver(params: params)
        return apiClient.send(resolver).compactMap(\.result)
    }
}
