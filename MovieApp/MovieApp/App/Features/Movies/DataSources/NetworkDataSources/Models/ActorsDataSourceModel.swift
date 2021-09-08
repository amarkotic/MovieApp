struct ActorDataSourceModel {

    let deparment: String
    let name: String
    let profilePath: String?
    let character: String

    init(from networkModel: ActorNetworkModel) {
        deparment = networkModel.deparment
        name = networkModel.name
        profilePath = networkModel.profilePath
        character = networkModel.character
    }

}
