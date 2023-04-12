import PromiseKit

protocol APIClient {
    func send<Resolver: HAPIResolver>(_ resolver: Resolver) -> Promise<HAPIResolverResponse<Resolver>>
}

class APIClientImpl: APIClient {
    
    private var baseURL: URL {
        Server.baseURL
    }
    
    func send<Resolver: HAPIResolver> (_ resolver: Resolver) -> Promise<HAPIResolverResponse<Resolver>> {
        let path = baseURL.appending(path: resolver.endpoint)
        var urlRequest = URLRequest(url: path)
        urlRequest.httpMethod = MethodType.post.rawValue
        urlRequest.httpBody = try? JSONEncoder().encode(resolver.params)
        
        return URLSession.shared.dataTask(.promise, with: urlRequest).map { data, response in
            let result = try? JSONDecoder().decode(Resolver.Result.self, from: data)
            return HAPIResolverResponse<Resolver>(result: result)
        }
    }
}

private extension APIClientImpl {
    enum MethodType: String {
        case post
        
        var string: String {
            rawValue.uppercased()
        }
    }
}
