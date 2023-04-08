struct HAPIResolverResponse<Resolver: HAPIResolver>: Decodable {
    var result: Resolver.Result?
}
