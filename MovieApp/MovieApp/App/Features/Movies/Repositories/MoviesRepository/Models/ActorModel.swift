struct ActorModel {

    let deparment: String
    let name: String
    let profilePath: String?
    let character: String

    init(from repositoryModel: ActorRepositoryModel) {
        deparment = repositoryModel.deparment
        name = repositoryModel.name
        profilePath = NetworkConstants.imagePath + (repositoryModel.profilePath ?? "")
        character = repositoryModel.character
    }

}
