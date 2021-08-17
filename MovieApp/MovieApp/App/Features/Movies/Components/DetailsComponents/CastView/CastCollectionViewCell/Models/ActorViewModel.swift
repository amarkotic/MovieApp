struct ActorViewModel {
    
    let nameLabel: String
    let roleLabel: String
    let posterPath: String?
    
    init(from actorModel: ActorModel) {
        nameLabel = actorModel.name
        roleLabel = actorModel.character
        posterPath = actorModel.profilePath
    }
    
}
