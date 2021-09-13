import Combine

protocol RealmDataSourceProtocol {

    func saveData(model: [RealmDataSourceModel], category: RealmCategory)

    func getMovies(for category: RealmCategory) -> AnyPublisher<[RealmDataSourceModel], Error>

}
