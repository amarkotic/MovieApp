struct CastModel {
    
    let name: String
    let role: String
    
    init(from repositoryModel: CastRepositoryModel) {
        name = repositoryModel.name
        role = repositoryModel.role
    }
    
}
