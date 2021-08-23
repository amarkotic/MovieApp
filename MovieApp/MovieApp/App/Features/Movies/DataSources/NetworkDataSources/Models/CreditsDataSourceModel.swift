struct CreditsDataSourceModel {
    
    var actors: [ActorDataSourceModel]
    var cast: [CastDataSourceModel]
    
    
    init(from model: CreditsNetworkModel) {
        actors = model.actors.map { ActorDataSourceModel(from: $0) }
        cast = model.crew.map { CastDataSourceModel(from: $0) }
    }
}
