struct CastViewModel {

    let name: String
    let role: String

    init(from model: CastModel) {
        name = model.name
        role = model.role
    }

}
