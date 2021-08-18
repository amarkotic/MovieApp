struct CastRepositoryModel {
    
    let name: String
    let role: String
    
    init(from dataSourceModel: CastDataSourceModel) {
        name = dataSourceModel.name
        role = dataSourceModel.role
    }
    
}
