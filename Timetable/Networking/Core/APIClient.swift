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
        return URLSession.shared.dataTask(.promise, with: urlRequest).compactMap { data, response in
            let result = try? JSONDecoder().decode(Resolver.Result.self, from: data)
            let resolverResponse = HAPIResolverResponse<Resolver>(result: result)
            return resolverResponse
        }
    }
}

enum ServerError: Error {
    case noConnection
}

private extension APIClientImpl {
    enum MethodType: String {
        case post
        
        var string: String {
            rawValue.uppercased()
        }
    }
}
