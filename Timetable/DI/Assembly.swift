import Foundation

protocol AssemblyProtocol {
    func resolve<Service>() -> Service?
}

class Assembly: AssemblyProtocol {
    static let shared = Assembly()
    
    private lazy var services: [String : Any] = [:]
    
    private init() {}
    
    func resolve<Service>() -> Service {
        let key = typeName(Service.self)
        assert(services[key] != nil, "Cannot assembly for \(Service.self)")
        return services[key] as! Service
    }
    
    func register<Service>(service: Service) {
        let key = typeName(Service.self)
        services[key] = service
    }
}

private extension Assembly {
    func typeName(_ some: Any) -> String {
        return (some is Any.Type) ? "\(some)" : "\(type(of: some))"
    }
}
