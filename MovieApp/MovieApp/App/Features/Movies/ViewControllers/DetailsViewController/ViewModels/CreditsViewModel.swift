struct CreditsViewModel {
    
    let actors: [ActorViewModel]
    let cast: [CastViewModel]
    
    init(from model: CreditsModel) {
        actors = model.actors.map { ActorViewModel(from: $0) }
        cast = model.cast.map { CastViewModel(from: $0) }
    }
    
}
