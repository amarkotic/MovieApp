struct CreditsModel {

    let actors: [ActorModel]
    let cast: [CastModel]

    init(from model: CreditsRepositoryModel) {
        actors = model.actors.map { ActorModel(from: $0) }
        cast = model.cast.map { CastModel(from: $0) }
    }

}
