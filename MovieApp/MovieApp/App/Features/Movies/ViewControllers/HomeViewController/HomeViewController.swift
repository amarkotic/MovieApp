import UIKit
import Combine

class HomeViewController: UIViewController {

    private typealias Snapshot = NSDiffableDataSourceSnapshot<SectionEnum, MovieCategoryViewModel>
    private typealias DataSource = UITableViewDiffableDataSource<SectionEnum, MovieCategoryViewModel>

    let defaultInset = 20
    let searchBarHeight = 43
    let rowHeight = CGFloat(311)

    var searchBar: SearchBar!
    var tableView: UITableView!

    var presenter: HomePresenter!
    var reloadModel: ReloadModel?

    private var disposables = Set<AnyCancellable>()
    private var dataSource: DataSource!

    convenience init(presenter: HomePresenter) {
        self.init()

        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        presenter.setDelegate(delegate: self)
//      presenter.initialFetch()
        searchBar.searchTextField.addTarget(self, action: #selector(goToSearch), for: .touchDown)
        makeDataSource()
        updateSnapshot(with: [.popular, .topRated, .trending])
    }

    private func makeDataSource() {
        dataSource = UITableViewDiffableDataSource(
            tableView: tableView,
            cellProvider: { tableView, indexPath, model -> UITableViewCell? in
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: CategoryTableViewCell.reuseIdentifier,
                    for: indexPath) as? CategoryTableViewCell
            else {
                return nil
            }

            cell.set(delegate: self)
            cell.populateCell(title: model, categories: self.presenter.getSubcategories(for: model))
            return cell
        })
    }

    private func updateSnapshot(with movies: [MovieCategoryViewModel]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(movies)
        dataSource.apply(snapshot)
    }

    func subcategoryPressed(category: MovieCategoryViewModel, subCategory: SubcategoryViewModel) {
        //        reloadModel = ReloadModel(category: category, subCategory: subCategory)
        //        presenter.fetchMovies(category: category, subCategory: subCategory)
        //        tableView.reloadData()
    }

    func showMovieDetails(with id: Int) {
        presenter.showMovieDetails(with: id)
    }

    @objc private func goToSearch() {
        presenter.goToSearch()
    }

    //    func reloadData() {
    //        tableView.reloadData()
    //    }

    //    func reloadFavoriteMovie() {
    //        guard
    //            let model = reloadModel
    //        else {
    //            presenter.initialFetch()
    //            return
    //        }
    //
    //        presenter.fetchMovies(category: model.category, subCategory: model.subCategory)
    //        tableView.reloadData()
    //    }

    //    override func viewWillAppear(_ animated: Bool) {
    //        reloadFavoriteMovie()
    //    }

}

// extension HomeViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return presenter.data.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard
//            let cell = tableView.dequeueReusableCell(
//                withIdentifier: CategoryTableViewCell.reuseIdentifier) as? CategoryTableViewCell
//        else {
//            return CategoryTableViewCell()
//        }
//
//        cell.set(delegate: self)
//        let data = presenter.data[indexPath.row]
//        cell.isMovieFavorited = { [weak self] id in
//            guard let self = self else { return }
//
//            self.presenter.updateFavoriteMovie(with: id)
//            self.reloadFavoriteMovie()
//        }
//        cell.populateCell(title: data.title, categories: data.categories, movies: data.movies)
//        return cell
//    }
//
// }
