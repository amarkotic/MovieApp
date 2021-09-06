struct CreditsRepositoryModel {

    let actors: [ActorRepositoryModel]
    let cast: [CastRepositoryModel]

    init(from model: CreditsDataSourceModel) {
        actors = model.actors.map { ActorRepositoryModel(from: $0) }
        cast = model.cast.map { CastRepositoryModel(from: $0) }
    }

}
