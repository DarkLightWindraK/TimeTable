protocol HAPIResolver {
    associatedtype Params: Encodable
    associatedtype Result: Decodable
    
    var endpoint: String { get }
    var params: Params { get }
}
