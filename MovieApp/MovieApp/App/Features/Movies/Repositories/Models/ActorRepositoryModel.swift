struct ActorRepositoryModel {

    let deparment: String
    let name: String
    let profilePath: String?
    let character: String

    init(from dataSourceModel: ActorDataSourceModel) {
        deparment = dataSourceModel.deparment
        name = dataSourceModel.name
        profilePath = dataSourceModel.profilePath
        character = dataSourceModel.character
    }

}
