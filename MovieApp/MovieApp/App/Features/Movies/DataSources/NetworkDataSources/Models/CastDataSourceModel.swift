struct CastDataSourceModel {
    
    let name: String
    let role: String
    
    init(from networkModel: CastNetworkModel) {
        name = networkModel.name
        role = networkModel.deparment
    }
    
}
