import Combine

protocol RealmDataSourceProtocol {

    func saveData(model: [RealmDataSourceModel], category: RealmCategory)

    func getPublisher(for category: RealmCategory) -> AnyPublisher<[MovieRepositoryModel], Error>

}
